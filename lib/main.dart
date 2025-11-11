import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:startup_task_app/core/app/app.dart';
import 'package:startup_task_app/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initializeServiceLocator();
  runApp(StartUpTaskApp());
}
