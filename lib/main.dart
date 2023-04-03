import 'package:dase_backoffice/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart' as injector;

import 'app.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injector.setup();
  runApp(const MyApp());
}
