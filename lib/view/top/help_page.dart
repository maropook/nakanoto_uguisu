import 'package:flutter/material.dart';
import 'package:nakanoto_coin_web/components/help_list_tile.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/models/help.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ヘルプ')),
        body: Container(
            color: Styles.primaryColor700,
            width: double.infinity,
            child: ListView(children: <Widget>[
              for (final help in helpList) HelpListTile(help),
            ])));
  }
}
