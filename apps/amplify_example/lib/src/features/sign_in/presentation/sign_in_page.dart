import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_example/src/features/authentication/authentication.dart';
import 'package:amplify_example/src/features/sign_in/sign_in.dart';
import 'package:amplify_example/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider(s).
    ref.listen(
      authenticationControllerProvider,
      (error, state) {
        switch (state) {
          case AsyncError(:final AuthException error):
            showSnackBar(context, error.message);
          default:
            break;
        }
      },
    );

    // Content.
    return CustomResponsiveLayoutBuilder(
      desktop: (_) => const SignInDesktopScreen(),
      mobile: (_) => const SignInMobileScreen(),
    );
  }
}
