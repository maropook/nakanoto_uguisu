import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';

class Store {
  Store(
    this.id,
    this.name,
    this.name2,
    this.path, {
    this.description = '',
    this.address = '',
    this.comment = '',
    this.latLng = const LatLng(0, 0),
  });
  int id;
  String name;
  String name2;
  String path;
  String description;
  String comment;
  String address;
  LatLng latLng;
}

List storeList = [
  Store(
      0, 'orihime_bus', '中能登町　コミュニティーバス', Assets.images.store.orihimeBus.path),
  Store(1, 'roadside_station', '道の駅　織姫の里　なかのと',
      Assets.images.store.roadsideStation.path,
      description: '定期的にポイントがもらえる/使えるイベント​を開催する予定です．みなさまのご来店をお待​ちしています．'),
];
