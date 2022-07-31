import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/qr_state.dart';
import 'package:nakanoto_coin_web/components/app_barcode_scanner_widget.dart';
import 'package:nakanoto_coin_web/view/top/qr/save.dart';

enum Status { save, pay }

final qrContentsProvider = StateProvider<QRStore>((ref) {
  return qrMap[0];
});

final isScanProvider = StateProvider<bool>((ref) {
  return false;
});

class QRPage extends ConsumerWidget {
  Status status = Status.pay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isScan = ref.watch(isScanProvider.state).state;
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () async {
                ref.read(isScanProvider.state).state = true;
                await Navigator.of(context).pushNamed('/top');
              })),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  ref.read(isScanProvider.state).state = false;
                },
                child: const Text('読み取り開始',
                    style: TextStyle(color: Styles.secondaryColor))),
          ),
          !isScan
              ? Padding(
                  padding: EdgeInsets.all(shortestSide * 0.05),
                  child: SizedBox(
                    width: shortestSide * 0.6,
                    height: shortestSide * 0.6,
                    child: BarcodeScannerWidget(
                      (String code) async {
                        if (isScan) {
                          return;
                        }

                        ref.read(isScanProvider.state).state = true;
                        List<String> contents = code.split('-');
                        int qrId = int.parse(contents[1]);
                        ref.read(qrContentsProvider.state).state = qrMap[qrId];
                        QRStore qrContent = qrMap[qrId];
                        if (contents.length <= 2 ||
                            contents[2] != 'password123') {
                          await Navigator.of(context)
                              .pushNamed('/error', arguments: '無効な二次元コードです');
                        }

                        if (qrContent.point > 0) {
                          //TODO: 使用済みかどうかチェック
                          // final snapshot = await FirebaseFirestore.instance
                          //     .collection('save')
                          //     .doc(FirebaseAuth.instance.currentUser!.email!)
                          //     .collection('save')
                          //     .doc(qrContent.id.toString())
                          //     .get();
                          // if (snapshot.exists) {
                          //   //TODO: 使用済みかどうかチェック
                          //   await Navigator.of(context).pushNamed('/error',
                          //       arguments: '使用済みの二次元コードです。また明日読み取ってください。');
                          // }

                          ref.read(isSavedProvider.state).state = false;
                          await Navigator.of(context).pushNamed('/save');
                          return;
                        }
                        if (qrContent.point == -1) {
                          await Navigator.of(context)
                              .pushNamed('/error', arguments: '期限切れの二次元コードです。');
                        }
                        if (qrContent.point == 0) {
                          await Navigator.of(context).pushNamed('/pay');
                          return;
                        }
                      },
                    ),
                  ),
                )
              : const Text('読み取り開始ボタンをクリックしてください'),
          !isScan
              ? const Text(
                  '二次元コードを\n枠内に収めてください',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
