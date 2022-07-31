import 'package:nakanoto_coin_web/gen/assets.gen.dart';
import 'package:pdfx/pdfx.dart';

class News {
  News(this.id, this.title, this.name, this.path, this.date, this.description,
      this.address, this.pdfPath);
  int id;
  String name;
  String title;
  String path;
  String date;
  String description;
  String address;
  PdfController pdfPath;
}

List<News> newsList = [
//   News(0, '新規加盟店', '道の駅　織姫の里\nなかのと', Assets.images.common.roadsideStation.path,
//       '2022.5.20', '''　「道の駅　織姫の里　なかのと」で本アプリ​
// のポイントが使えるようになりました．また，​
// 定期的にポイントがもらえる/使えるイベント​
// を開催する予定です．みなさまのご来店をお待​
// ちしています．''', '''
// 住所：〒929-1721 中能登町井田ぬ部10番地1​
// 電話   ：0767-76-8000​
// FAX   ：0767-76-8001​
// サイト：http://orihime-nakanoto.jp'''),
//   News(1, '中能登町', 'おりひめバス', Assets.images.store.orihimeBus.path, '2022.5.20',
//       '', ''),

  News(0, '実証実験イベント', 'モニターの予定', Assets.images.news.newsEveryone.path,
      '2022.7.20', '', '', pdfController0),
  News(1, '実証実験イベント', 'モニターの皆様', Assets.images.news.newsEveryone.path,
      '2022.7.20', '', '', pdfController1),
  News(2, '実証実験イベント', '二次元コード設置場所', Assets.images.store.roadsideStation.path,
      '2022.7.29', '', '', pdfController2),
];

final pdfController0 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.schedule),
);
final pdfController1 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.everyone),
);
final pdfController2 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.qrInstallation),
);
