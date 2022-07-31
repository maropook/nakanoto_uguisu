import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/components/my_button.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/view/top/qr/pay.dart';

class InputWidget extends ConsumerWidget {
  InputWidget({Key? key}) : super(key: key);
  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '<',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userInput = ref.watch(userInputProvider);
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return SizedBox(
      width: shortestSide,
      height: shortestSide / 1.2,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2.5),
          itemBuilder: (BuildContext context, int index) {
            // Clear Button
            if (index == 9) {
              return const SizedBox();

              // MyButton(//all delete
              //   textColor: Styles.secondaryColor,
              //   onTap: () {
              //     ref.read(userInputProvider.state).state = '';
              //   },
              //   buttonText: buttons[index],
              //   color: Styles.primaryColor700,
              // );
            }
            // Delete Button
            else if (index == 11) {
              return MyButton(
                onTap: () {
                  if (userInput.isEmpty) {
                    return;
                  }
                  ref.read(userInputProvider.state).state =
                      userInput.substring(0, userInput.length - 1);
                },
                textColor: Styles.secondaryColor,
                buttonText: buttons[index],
                color: Styles.primaryColor700,
              );
            }

            //  other buttons 0~9
            else {
              return MyButton(
                onTap: () {
                  ref.read(userInputProvider.state).state += buttons[index];
                },
                buttonText: buttons[index],
                color: Styles.secondaryColor,
              );
            }
          }),
    );
  }
}
