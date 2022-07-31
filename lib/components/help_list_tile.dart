import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';
import 'package:nakanoto_coin_web/models/help.dart';

class HelpListTile extends StatelessWidget {
  HelpListTile(this.help, {Key? key}) : super(key: key);
  Help help;

  @override
  Widget build(BuildContext context) {
    Future<void> goToDetailPage() async {
      await Navigator.of(context).pushNamed('/help_detail', arguments: help.id);
    }

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return InkWell(
      onTap: goToDetailPage,
      child: Padding(
        padding: EdgeInsets.only(top: shortestSide / 28),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              color: Colors.white,
              height: shortestSide / 4.5,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ThumbnailImage(
                  //     shortestSide / 3.2 * 1.63, shortestSide / 3.2, help.path),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '【${help.title}】${help.name}',
                        style: TextStyle(
                            fontSize: shortestSide / 22,
                            color: Styles.commonTextColor),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
