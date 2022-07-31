import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/components/store_list_tile.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';

import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/store.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;
    return Scaffold(
        body: Scaffold(
      body: Center(
        child: Text("準備中", style: TextStyle(fontSize: shortestSide / 22)),
      ),
    )

        //      Column(children: [
        //   Expanded(
        //       child: ListView(
        //     children: <Widget>[
        //       ThumbnailImage(
        //           shortestSide, shortestSide, Assets.images.common.mapSample.path),
        //       for (final store in storeList)
        //         StoreListTile(null, store, Styles.accentColor),
        //     ],
        //   ))
        // ])

        );
  }
}
