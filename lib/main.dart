import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes_app/src/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict device orientation to portrait to avoid screen rotation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
