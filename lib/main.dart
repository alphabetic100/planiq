import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planiq/core/services/local_service.dart';
import 'package:planiq/core/services/push_notification_service.dart';
import 'package:planiq/firebase_options.dart';
import 'package:planiq/planiq_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseApi().initNotifications();
  await PushNotificationService().initialize();
  runApp(PlaniqApp());
}
