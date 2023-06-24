import 'package:dase_backoffice/core/bloc/observer/bloc_observer.dart';
import 'package:dase_backoffice/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart'
    as injector;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injector.setup();
  Bloc.observer = DaseBlocObserver();
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}
