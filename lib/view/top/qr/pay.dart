import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/components/pay/input.dart';
import 'package:nakanoto_coin_web/components/thumbnail_and_name.dart';
import 'package:nakanoto_coin_web/provider/login_provider.dart';
import 'package:nakanoto_coin_web/service/providers_provider.dart';
import 'package:nakanoto_coin_web/models/point.dart';
import 'package:nakanoto_coin_web/models/qr_state.dart';
import 'package:nakanoto_coin_web/service/will_pop_callback.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/view/qr.dart';

final userInputProvider = StateProvider<String>((ref) {
  return '';
});

class PayPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userInput = ref.watch(userInputProvider);
    Point point = ref.watch(pointProvider).point;

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;
    QRStore qrContents = ref.watch(qrContentsProvider.state).state;

    return WillPopScope(
        onWillPop: willPopCallback,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("なかのとをつかう"),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ThumbnailAndName(
                      shortestSide / 3.2 * 1.63,
                      shortestSide / 3.2,
                      qrContents.path,
                      qrContents.name_kana),
                  pointTile('現在の\nポイント ', point.point.toString(), shortestSide,
                      isWhite: true),
                  pointTile(
                      '消費後の\nポイント ',
                      (userInput.isNotEmpty
                              ? point.point - int.parse(userInput)
                              : point.point)
                          .toString(),
                      shortestSide,
                      isWhite: true),
                  pointTile('　消費 ', userInput.isNotEmpty ? userInput : '0',
                      shortestSide),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          child: Container(
                            color: Styles.primaryColor,
                            width: shortestSide / 1.1,
                            child: const Center(
                              child: Text('完了',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                            ),
                          ),
                          onTap: () => pay(context, ref),
                        ),
                      ),
                    ],
                  ),
                  InputWidget(),
                ]),
          ),
        ));
  }

  Widget pointTile(String description, String point, double shortestSide,
      {bool isWhite = false}) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isWhite
                          ? Styles.secondaryColor900
                          : Styles.secondaryColor,
                    )),
                Container(
                    height: 60, width: 1.5, color: Styles.secondaryColor900),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(point,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: isWhite
                          ? Styles.secondaryColor900
                          : Styles.secondaryColor,
                    )),
                Text('pt',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isWhite
                          ? Styles.secondaryColor900
                          : Styles.secondaryColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pay(BuildContext context, WidgetRef ref) async {
    var rand = math.Random();
    String userInput = ref.watch(userInputProvider);
    Point point = ref.watch(pointProvider).point;
    final user = ref.watch(loginProvider);
    if (userInput.isEmpty ||
        int.parse(userInput) <= 0 ||
        point.point < int.parse(userInput)) {
      return null;
    }
    int updatePoint = point.point - int.parse(userInput);
    int updateUsedPoint = point.usedPoint + int.parse(userInput);
    ref.read(pointProvider.notifier).updatePoint(
          point.copyWith(point: updatePoint, usedPoint: updateUsedPoint),
        );

    QRStore qrContents = ref.watch(qrContentsProvider.state).state;

    final date = DateTime.now().toLocal().toIso8601String();
    await FirebaseFirestore.instance.collection('posts').doc().set({
      'point_of_change': userInput,
      'transaction': 'pay',
      'place': qrContents.name,
      'current_point': updatePoint,
      'email': user.email,
      'date': date
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .update({
      'point': updatePoint,
      'used_point': updateUsedPoint,
      'date': DateTime.now().toLocal().toIso8601String(),
    });
    await Navigator.of(context).pushNamed('/payed_page');
  }
}
