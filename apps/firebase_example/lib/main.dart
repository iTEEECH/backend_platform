import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/firebase_options.dart';
import 'package:firebase_example/src/application/application.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    // Flutter engine initialization.
    WidgetsFlutterBinding.ensureInitialized();

    // Firebase initialization.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Handle browser url.
    if (kIsWeb) usePathUrlStrategy();

    runApp(
      const ProviderScope(
        child: Application(),
      ),
    );
  }, (Object error, StackTrace stackTrace) async {
    throw Error.throwWithStackTrace(error, stackTrace);
  });
}
