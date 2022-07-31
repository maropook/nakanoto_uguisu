import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakanoto_coin_web/config/styles.dart';
import 'package:nakanoto_coin_web/view/top/help_detail.dart';
import 'package:nakanoto_coin_web/view/top/help_page.dart';
import 'package:nakanoto_coin_web/view/top/news/news_detail.dart';
import 'package:nakanoto_coin_web/view/top/qr/payed_page.dart';
import 'package:nakanoto_coin_web/view/login.dart';
import 'package:nakanoto_coin_web/view/qr.dart';
import 'package:nakanoto_coin_web/view/top/my_page/history_point.dart';
import 'package:nakanoto_coin_web/view/error.dart';
import 'package:nakanoto_coin_web/view/top/qr/pay.dart';
import 'package:nakanoto_coin_web/view/top/qr/save.dart';
import 'package:nakanoto_coin_web/top_page_route.dart';
import 'package:nakanoto_coin_web/view/top/store/google_map.dart';
import 'package:nakanoto_coin_web/view/top/store/store_detail.dart';

class NakanotoCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Top(),
        '/login': (BuildContext context) => Top(),
        '/top': (BuildContext context) => Top(),
        '/qr': (BuildContext context) => QRPage(),
        '/payed_page': (BuildContext context) => PayedView(true),
        '/save': (BuildContext context) => SavePage(),
        '/pay': (BuildContext context) => PayPage(),
        '/error': (BuildContext context) => ErrorPage(),
        '/test': (BuildContext context) => GoogleMapWidget(),
        '/history_point': (BuildContext context) => HistoryPoint(),
        '/news_detail': (BuildContext context) => NewsDetail(),
        '/store_detail': (BuildContext context) => StoreDetail(),
        '/help': (BuildContext context) => HelpPage(),
        '/help_detail': (BuildContext context) => HelpDetail(),
      },
      title: 'なかのと',
      theme: ThemeData(
        primarySwatch: Styles.primarySwatch,
        primaryColor: Styles.primaryColor,
        brightness: Brightness.light,
        backgroundColor: Styles.pageBackground,
        appBarTheme: Styles.appBarTheme,
        scaffoldBackgroundColor: Styles.pageBackground,
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(
          Styles.textTheme,
        ),
      ),
    );
  }
}

Future<void> errorPage(String err, BuildContext context) async {
  await Navigator.of(context).pushNamed('/error', arguments: err);
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return TopPageRoute();
          }
          return LoginPage();
        },
      ),
    );
  }
}
