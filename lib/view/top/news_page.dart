import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/components/news_list_tile.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/news.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Styles.primaryColor700,
            width: double.infinity,
            child: ListView(children: <Widget>[
              for (final news in newsList) NewsListTile(news),
            ])));
  }
}
