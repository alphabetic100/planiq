import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    log(fCMToken.toString());
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log("Title: ${message.notification?.title}");
  log("Body: ${message.notification?.body}");
}
