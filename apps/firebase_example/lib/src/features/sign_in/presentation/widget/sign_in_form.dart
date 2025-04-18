import 'package:firebase_example/src/features/authentication/application/authentication_controller.dart';
import 'package:firebase_example/src/features/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({super.key});

  void _signInWithEmailAndPassword(
    BuildContext context,
    WidgetRef ref,
    String email,
    String password,
  ) {
    if (context.mounted) {
      ref.read(authenticationControllerProvider.notifier).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hook(s).
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    // Content.
    return Column(
      spacing: 24.0,
      children: <Widget>[
        SignInEmailField(controller: emailController),
        SignInPasswordField(controller: passwordController),
        SignInForgotPasswordButton(),
        SignInButton(
          onPressed: () {
            _signInWithEmailAndPassword(
              context,
              ref,
              emailController.text,
              passwordController.text,
            );
          },
        ),
      ],
    );
  }
}
