import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_example/amplifyconfiguration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:amplify_example/src/application/application.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    // Flutter engine initialization.
    WidgetsFlutterBinding.ensureInitialized();

    // Amplify initialization.
    await Amplify.addPlugins([
      AmplifyAuthCognito(),
    ]);
    await Amplify.configure(amplifyconfig);

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
