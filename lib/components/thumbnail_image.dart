import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';

class ThumbnailImage extends StatelessWidget {
  ThumbnailImage(this.width, this.height, this.path);
  final double width;
  final double height;
  final String? path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path == null ? Assets.images.common.roadsideStation.path : path!,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
