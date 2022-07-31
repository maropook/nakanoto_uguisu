import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/store.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';

class StoreDetail extends StatelessWidget {
  StoreDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;

    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '【${storeList[index].name2}】',
                style: TextStyle(
                    fontSize: shortestSide / 22, color: Styles.commonTextColor),
                textAlign: TextAlign.left,
              ),
              ThumbnailImage(
                  shortestSide, shortestSide / 1.63, storeList[index].path),
              Text(
                storeList[index].description,
                style: TextStyle(
                    fontSize: shortestSide / 22, color: Styles.commonTextColor),
                textAlign: TextAlign.center,
              ),
              Text(
                storeList[index].address,
                style: TextStyle(
                    fontSize: shortestSide / 22, color: Styles.commonTextColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
