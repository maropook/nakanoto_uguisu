import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakanoto_coin_web/config/config.dart';
import 'package:nakanoto_coin_web/nakanoto_coin.dart';

final configurations = Configurations();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId));
  runApp(
    ProviderScope(
      child: NakanotoCoin(),
    ),
  );
}
