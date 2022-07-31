import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/service/will_pop_callback.dart';
import 'package:nakanoto_coin_web/view/top/qr/pay.dart';

class PayedView extends ConsumerWidget {
  PayedView(this.isPay, {Key? key}) : super(key: key);
  bool isPay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userInput = ref.watch(userInputProvider);
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return WillPopScope(
        onWillPop: willPopCallback,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('なかのと'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userInput + 'pt 消費しました',
                  style: const TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  child: Container(
                    color: Styles.primaryColor,
                    width: shortestSide / 1.1,
                    child: const Center(
                      child: Text('ホームに戻る',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                  onTap: () async {
                    ref.read(userInputProvider.state).state = '';
                    await Navigator.pushNamed(context, '/top');
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
