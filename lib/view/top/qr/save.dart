import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/components/thumbnail_and_name.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/provider/login_provider.dart';
import 'package:nakanoto_coin_web/view/qr.dart';
import 'package:nakanoto_coin_web/service/providers_provider.dart';
import 'package:nakanoto_coin_web/models/point.dart';
import 'package:nakanoto_coin_web/models/qr_state.dart';
import 'package:nakanoto_coin_web/service/will_pop_callback.dart';

final isSavedProvider = StateProvider<bool>((ref) {
  return false;
});

class SavePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Point point = ref.watch(pointProvider).point;

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;
    bool isSaved = ref.watch(isSavedProvider.state).state;
    QRStore qrContents = ref.watch(qrContentsProvider.state).state;
    TextStyle textStyle22 = TextStyle(
      fontSize: shortestSide / 22,
      fontWeight: FontWeight.bold,
    );
    return WillPopScope(
        onWillPop: willPopCallback,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("ためる"),
          ),
          backgroundColor: Styles.pageBackground,
          body: Column(
            children: <Widget>[
              ThumbnailAndName(
                shortestSide / 3.2 * 1.63,
                shortestSide / 3.2,
                qrContents.path,
                qrContents.name_kana,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(qrContents.point.toString(),
                                    style: TextStyle(
                                      fontSize: shortestSide / 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Text('pt', style: textStyle22)
                            ],
                          ),
                          !isSaved
                              ? Text('受け取れます', style: textStyle22)
                              : Text('受け取りました', style: textStyle22),
                        ],
                      ),
                      !isSaved
                          ? Container()
                          : Image.asset(
                              Assets.images.common.present.path,
                              width: shortestSide / 2.5,
                            ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: !isSaved
                                ? ElevatedButton(
                                    child: const Text('受け取る',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Styles.pageBackground)),
                                    onPressed: () async =>
                                        await save(context, ref))
                                : ElevatedButton(
                                    child: const Text('ホームに戻る',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Styles.pageBackground)),
                                    onPressed: () async =>
                                        await Navigator.of(context)
                                            .pushNamed('/top')),
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ));
  }

  Future save(BuildContext context, WidgetRef ref) async {
    Point point = ref.watch(pointProvider).point;
    final loginProviderState = ref.watch(loginProvider);
    QRStore qrContents = ref.watch(qrContentsProvider.state).state;

    int updatedPoint = point.point + qrContents.point;
    ref
        .read(pointProvider.notifier)
        .updatePoint(point.copyWith(point: updatedPoint));

    final date = DateTime.now().toLocal().toIso8601String();
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('save')
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('save')
        .doc(qrContents.id.toString())
        .set({
      'point_of_change': qrContents.point,
      'transaction': 'save',
      'current_point': updatedPoint,
      'email': loginProviderState.user.email,
      'date': date
    });

    await FirebaseFirestore.instance.collection('posts').doc().set({
      'point_of_change': qrContents.point,
      'transaction': 'save',
      'place': qrContents.name,
      'current_point': updatedPoint,
      'email': loginProviderState.user.email,
      'date': date
    });

    debugPrint(loginProviderState.user.email);
    debugPrint(point.point.toString());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(loginProviderState.user.email)
        .update({
      'point': updatedPoint,
      'used_point': point.usedPoint,
      'date': date,
    });

    ref.read(isSavedProvider.state).state = true;
  }
}
