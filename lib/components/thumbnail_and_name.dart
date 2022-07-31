import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/components/thumbnail_image.dart';

class ThumbnailAndName extends StatelessWidget {
  ThumbnailAndName(this.width, this.height, this.path, this.name);
  final double width;
  final double height;
  final String? path;
  final String name;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return Row(
      children: [
        Center(child: ThumbnailImage(width, height, path)),
        Flexible(
          child: Text(name,
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                fontSize: shortestSide / 22,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.clip,
              )),
        )
      ],
    );
  }
}
