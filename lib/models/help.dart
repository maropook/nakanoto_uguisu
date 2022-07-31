import 'package:nakanoto_coin_web/gen/assets.gen.dart';
import 'package:pdfx/pdfx.dart';

class Help {
  Help(this.id, this.title, this.name, this.path, this.date, this.description,
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

List<Help> helpList = [
//   Help(0, '新規加盟店', '道の駅　織姫の里\nなかのと', Assets.images.common.roadsideStation.path,
//       '2022.5.20', '''　「道の駅　織姫の里　なかのと」で本アプリ​
// のポイントが使えるようになりました．また，​
// 定期的にポイントがもらえる/使えるイベント​
// を開催する予定です．みなさまのご来店をお待​
// ちしています．''', '''
// 住所：〒929-1721 中能登町井田ぬ部10番地1​
// 電話   ：0767-76-8000​
// FAX   ：0767-76-8001​
// サイト：http://orihime-nakanoto.jp'''),
//   Help(1, '中能登町', 'おりひめバス', Assets.images.store.orihimeBus.path, '2022.5.20',
//       '', ''),

  Help(0, 'ヘルプ', 'ポイントゲット', Assets.images.news.newsEveryone.path, '2022.7.31',
      '', '', pdfController0),
  Help(1, 'ヘルプ', '支払う', Assets.images.news.newsEveryone.path, '2022.7.31', '',
      '', pdfController1),
  Help(2, 'ヘルプ', '残高・履歴', Assets.images.store.roadsideStation.path, '2022.7.31',
      '', '', pdfController2),
];

final pdfController0 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.pointGet),
);
final pdfController1 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.pay),
);
final pdfController2 = PdfController(
  document: PdfDocument.openAsset(Assets.pdf.history),
);
