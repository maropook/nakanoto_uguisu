import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nakanoto_coin_web/gen/assets.gen.dart';

// https://nakanoto_coin_web-1-password123
class QRStore {
  QRStore(
    this.id,
    this.name,
    this.name_kana,
    this.path,
    this.point, //0だったらpay
    {
    this.description = '',
    this.address = '',
    this.comment = '',
    this.latLng = const LatLng(0, 0),
  });
  int id;
  String name;
  int point;
  String name_kana;
  String path;
  String description;
  String comment;
  String address;
  LatLng latLng;
}
// 0:pay 0>:save -1:期限切れ

List<QRStore> qrMap = [
  QRStore(0, '', 'null', Assets.images.store.orihimeBus.path, 0),
  QRStore(1, 'orihime_bus', '中能登町　コミュニティーバス',
      Assets.images.store.orihimeBus.path, 0),
  QRStore(2, 'roadside_station', '道の駅　織姫の里　なかのと',
      Assets.images.store.roadsideStation.path, 0,
      description: '定期的にポイントがもらえる/使えるイベント​を開催する予定です．みなさまのご来店をお待​ちしています．'),
  QRStore(3, 'amanomiya_burial_mouds', '雨ノ宮古墳群',
      Assets.images.store.amanomiyaBurialMouds.path, 100,
      comment: 'おめでとう！100ptゲットだね！！',
      address: '〒929-1601 石川県鹿島郡中能登町西馬場',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  QRStore(4, 'iida_fudo_waterfall', '井田不動滝',
      Assets.images.store.iidaFudoWaterfall.path, 20,
      address: '〒929-1721 石川県鹿島郡中能登町井田',
      comment: '見つけてくれてありがとう！20ptあげちゃうよ！！',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  QRStore(5, 'orimono_design_center', '中能登町織物デザインセンター',
      Assets.images.store.orimonoDesignCenter.path, 40,
      comment: 'ドレス一着レンタルごとに40ptプレゼント！',
      address: '〒929-1604 石川県鹿島郡中能登町能登部下１３４−１',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  QRStore(6, 'al_plaza_sikazima', 'アル・プラザ鹿島',
      Assets.images.store.alPlazaSikazima.path, 0,
      comment: '100ptでお菓子プレゼント！',
      address: '〒929-1721 石川県鹿島郡中能登町井田と 部１番地１ 部1−１',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  QRStore(7, 'rengeya', 'カフェ食堂れんげや', Assets.images.store.rengeya.path, 0,
      comment: '100ptでケーキと交換できますよ！',
      address: '〒929-1721 中能登町井田ぬ部10-1',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  QRStore(8, 'sakuma_okonomiyaki', 'さくまお好み焼き店',
      Assets.images.store.sakumaOkonomiyaki.path, 0,
      comment: '100ptで100円引き！',
      address: '〒929-1634 石川県鹿島郡中能登町福田フ２７−１',
      latLng: const LatLng(36.939194943479016, 136.8722953492308)),
  //なかのと実証実験
  QRStore(
      9, 'roadside_station', '金糸瓜', Assets.images.store.paghettiSquash.path, 10,
      description: '金糸瓜'),
  QRStore(10, 'roadside_station', '金とんカレー',
      Assets.images.store.roadsideStation.path, 5,
      description: '金とんカレー'),
  QRStore(11, 'roadside_station', '能登上布小物',
      Assets.images.store.roadsideStation.path, 10,
      description: '能登上布小物'),
  QRStore(12, 'roadside_station', '古代米',
      Assets.images.store.riceBallReplica.path, 3,
      description: '古代米'),
  QRStore(
      13, 'roadside_station', 'お米', Assets.images.store.roadsideStation.path, 5,
      description: 'お米'),
  QRStore(14, 'roadside_station', 'お弁当コーナー',
      Assets.images.store.roadsideStation.path, 3,
      description: 'お弁当コーナー'),
  QRStore(15, 'roadside_station', 'どぶろくコーナー',
      Assets.images.store.roadsideStation.path, 10,
      description: 'どぶろくコーナー'),
  QRStore(16, 'roadside_station', 'コミュニティバス停',
      Assets.images.store.roadsideStation.path, 5,
      description: 'コミュニティバス停'),
  QRStore(17, 'roadside_station', '男女トイレ',
      Assets.images.store.roadsideStation.path, 10,
      description: '男女トイレ'),
  QRStore(18, 'roadside_station', 'ショーケース',
      Assets.images.store.roadsideStation.path, 3,
      description: 'ショーケース'),
  QRStore(19, 'roadside_station', 'ご当地のマンホール',
      Assets.images.store.roadsideStation.path, 5,
      description: 'ご当地のマンホール'),
  QRStore(20, 'roadside_station', 'おにぎりのレプリカ展示',
      Assets.images.store.roadsideStation.path, 10,
      description: 'おにぎりのレプリカ展示'),
  //なかのと実証実験
];


// 9:金糸瓜 10p https://nakanoto_coin_web-9-password123
// 10:金とんカレー ５p https://nakanoto_coin_web-10-password123
// 11:能登上布小物 10p https://nakanoto_coin_web-11-password123
// 12:古代米 ３p https://nakanoto_coin_web-12-password123
// 13:お米 ５p https://nakanoto_coin_web-13-password123
// 14:お弁当コーナー ３p https://nakanoto_coin_web-14-password123

// 15:どぶろくコーナー 10p https://nakanoto_coin_web-15-password123
// 16:コミュニティバス停 ５p https://nakanoto_coin_web-16-password123
// 17:男女トイレ 10p https://nakanoto_coin_web-17-password123
// 18:ショーケース ３p https://nakanoto_coin_web-18-password123
// 19:ご当地マンホール ５p https://nakanoto_coin_web-19-password123
// 20:おにぎりのレプリカ展示 10p https://nakanoto_coin_web-20-password123
