import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/provider/login_provider.dart';
import 'package:nakanoto_coin_web/config/styles.dart';

class ConfigPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();
      ref.read(loginProvider.notifier).reset();
      await Navigator.of(context).pushNamed('/login');
    }

    Future<void> goToPoint() async {
      await Navigator.of(context).pushNamed('/history_point');
    }

    Future<void> goToHelp() async {
      await Navigator.of(context).pushNamed('/help');
    }

    return Scaffold(
        body: Container(
            color: Styles.primaryColor700,
            width: double.infinity,
            child: ListView(children: <Widget>[
              // ConfigListTile(Icons.manage_accounts_sharp, 'アカウント設定', null),
              ConfigListTile(Icons.menu_book_outlined, 'ポイント履歴', goToPoint),
              ConfigListTile(Icons.help, 'ヘルプ', goToHelp),
              ConfigListTile(Icons.logout, 'ログアウト', logOut)
            ])));
  }
}

class ConfigListTile extends StatelessWidget {
  ConfigListTile(this.icon, this.title, this.fn, {Key? key}) : super(key: key);
  IconData icon;
  String title;
  Future<void> Function()? fn;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return Padding(
      padding: EdgeInsets.only(top: shortestSide / 28),
      child: InkWell(
        onTap: fn,
        child: Container(
          color: Colors.white,
          height: shortestSide / 6.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: shortestSide / 20, right: shortestSide / 20),
                child: Icon(
                  icon,
                  color: Styles.commonTextColor,
                  size: shortestSide / 12,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: shortestSide / 20, color: Styles.commonTextColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
