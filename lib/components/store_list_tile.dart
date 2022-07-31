import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/store.dart';

class StoreListTile extends StatelessWidget {
  StoreListTile(this.fn, this.store, this.color, {Key? key}) : super(key: key);
  Store store;
  Color color;
  Future<void> Function()? fn;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    Future<void> goToDetailPage() async {
      await Navigator.of(context)
          .pushNamed('/store_detail', arguments: store.id);
    }

    return InkWell(
      onTap: goToDetailPage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThumbnailImage(shortestSide, shortestSide / 4.5, store.path),
          Container(
            width: shortestSide,
            color: color,
            height: shortestSide / 6,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                store.name2,
                style: TextStyle(
                    fontSize: shortestSide / 22, color: Styles.commonTextColor),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
