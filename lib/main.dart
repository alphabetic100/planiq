import 'package:flutter/material.dart';
import 'package:planiq/core/services/local_service.dart';
import 'package:planiq/planiq_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService.init();
  runApp(PlaniqApp());
}
