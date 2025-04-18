import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_example/src/features/authentication/authentication.dart';
import 'package:supabase_example/src/features/sign_in/sign_in.dart';
import 'package:supabase_example/src/widgets/widgets.dart';
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
          default: break;
        }
      },
    );

    // Content.
    return Scaffold(body: CustomResponsiveLayoutBuilder(
      desktop: (_) => const SignInDesktopScreen(),
      mobile: (_) => const SignInMobileScreen(),
    ),
    );
  }
}
