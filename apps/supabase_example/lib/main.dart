import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_example/src/application/application.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    // Flutter engine initialization.
    WidgetsFlutterBinding.ensureInitialized();

    // Supabase initialization.
    await Supabase.initialize(
      url: '',
      anonKey: '',
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
