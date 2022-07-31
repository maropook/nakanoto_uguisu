## 使い方
## 二次元コードの追加方法
### 1. `qr_state.dart`のqrMapの中にQRStoreクラスを追加する。
- id
- name(英語での名前)
- name2(表示名)
- path(追加した写真のパス assets/images/以下を入力)
- point(「貯める」ならゲットするポイント数、「つかう」ならば0を設定する

### 2. 写真を追加する
2.で設定した[name].pngとして、storeディレクトリに追加する
写真は3:2の比率にしてください

### 3. 二次元コードを作成する
https://qr.quel.jp/url.php
上記のリンクで作成する。「https://nakanoto_coin_web-[さっき設定したid]-password123」で設定してください
(例:https://nakanoto_coin_web-111-password123)

### テストする


# nakanoto_coin_web

https://nakanoto-coin.web.app/


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


[futureProvider](https://riverpod.dev/ja/docs/providers/future_provider/)

[GoogleMap](https://future-architect.github.io/articles/20211224a/)

[仕様書](https://kosenjp.sharepoint.com/:p:/r/sites/018_2019/_layouts/15/doc2.aspx?sourcedoc=%7B4434CA61-F488-4CF9-B693-B484281999C7%7D&file=%E5%9C%B0%E5%9F%9F%E3%82%A2%E3%83%97%E3%83%AA_%E9%80%9A%E8%B2%A8_%E4%BB%95%E6%A7%98%E6%9B%B8.pptx&action=edit&mobileredirect=true&wdOrigin=TEAMS-ELECTRON.teams.files&wdExp=TEAMS-CONTROL&wdhostclicktime=1650060517175&cid=1105980d-14fb-46b2-9334-9c53317599c4)


[ai_barcode](https://stackoverflow.com/questions/64283370/possibilities-to-scan-qr-code-in-flutter-web)

[jsQR.js](https://github.com/pdliuw/ai_barcode/blob/master/example/web/jsQR.js)
jsQRをindex.htmlのある階層に追加、index.htmlに`<script src="jsQR.js" type="application/javascript"></script> `を追加

### 画像を追加したとき
```
flutter pub run build_runner build --delete-conflicting-outputs
```
