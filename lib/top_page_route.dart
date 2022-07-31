import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';
import 'package:nakanoto_coin_web/view/top/my_page.dart';
import 'package:nakanoto_coin_web/view/top/news_page.dart';
import 'package:nakanoto_coin_web/view/top/top_page.dart';

class TopPageRoute extends ConsumerWidget {
  final _pageWidgets = [
    // StorePage(),
    // NewsPage(),
    // TopPage(),
    // StatusPage(),
    // ConfigPage()
    NewsPage(),
    TopPage(),
    ConfigPage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _currentIndex = ref.watch(currentIndexProvider);
    final Size size = MediaQuery.of(context).size;
    final double iconSize = size.shortestSide / 10;
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: _buildNavigationIconWithName(
          //       SvgPicture.asset(
          //         Assets.images.common.footer.mapPin,
          //         width: iconSize,
          //         height: iconSize,
          //       ),
          //       '協賛店'),
          //   activeIcon: _buildNavigationIconWithName(
          //       SvgPicture.asset(Assets.images.common.footer.mapPin,
          //           width: iconSize,
          //           height: iconSize,
          //           color: Styles.secondaryColor),
          //       '協賛店',
          //       isFocus: true),
          //   tooltip: '協賛店',
          //   label: '協賛店',
          // ),
          BottomNavigationBarItem(
              icon: _buildNavigationIconWithName(
                  SvgPicture.asset(Assets.images.common.footer.speechBaloon,
                      width: iconSize, height: iconSize),
                  'お知らせ'),
              activeIcon: _buildNavigationIconWithName(
                  SvgPicture.asset(Assets.images.common.footer.speechBaloon,
                      width: iconSize,
                      height: iconSize,
                      color: Styles.secondaryColor),
                  'お知らせ',
                  isFocus: true),
              label: 'お知らせ'),
          BottomNavigationBarItem(
              icon: _buildNavigationIconWithName(
                SvgPicture.asset(
                  Assets.images.common.footer.home,
                  width: iconSize,
                  height: iconSize,
                ),
                'ホーム',
              ),
              activeIcon: _buildNavigationIconWithName(
                  SvgPicture.asset(Assets.images.common.footer.home,
                      width: iconSize,
                      height: iconSize,
                      color: Styles.secondaryColor),
                  'ホーム',
                  isFocus: true),
              label: 'ホーム'),
          // BottomNavigationBarItem(
          //     icon: _buildNavigationIconWithName(
          //         SvgPicture.asset(Assets.images.common.warbler.halfWarblerSvg,
          //             width: iconSize, height: iconSize),
          //         '育てる'),
          //     activeIcon: _buildNavigationIconWithName(
          //         SvgPicture.asset(Assets.images.common.warbler.halfWarblerSvg,
          //             width: iconSize,
          //             height: iconSize,
          //             color: Styles.secondaryColor),
          //         '育てる',
          //         isFocus: true),
          //     label: '育てる'),
          BottomNavigationBarItem(
              icon: _buildNavigationIconWithName(
                  Icon(Icons.list, size: iconSize, color: Styles.primaryColor),
                  '設定'),
              activeIcon: _buildNavigationIconWithName(
                  Icon(Icons.list,
                      size: iconSize, color: Styles.secondaryColor),
                  '設定',
                  isFocus: true),
              label: '設定'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Styles.accentColor,
        onTap: (int index) {
          ref.read(currentIndexProvider.state).state = index;
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

  Widget _buildNavigationIconWithName(Widget icon, String label,
      {bool isFocus = false}) {
    return Column(
      children: [
        icon,
        Text(label,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: isFocus ? Styles.secondaryColor : Styles.primaryColor)),
      ],
    );
  }
}

final currentIndexProvider = StateProvider((ref) {
  return 1;
});
