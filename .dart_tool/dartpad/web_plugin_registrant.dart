// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// ignore_for_file: type=lint

import 'package:ai_barcode_web/ai_barcode_web.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:mobile_scanner/mobile_scanner_web_plugin.dart';
import 'package:pdfx/src/renderer/web/pdfx_plugin.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AiBarcodeWebPlugin.registerWith(registrar);
  FirebaseFirestoreWeb.registerWith(registrar);
  DeviceInfoPlusPlugin.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  GoogleMapsPlugin.registerWith(registrar);
  MobileScannerWebPlugin.registerWith(registrar);
  PdfxPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
