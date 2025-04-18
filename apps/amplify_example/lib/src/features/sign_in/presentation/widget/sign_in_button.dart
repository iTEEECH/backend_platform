import 'package:amplify_example/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  /// [onPressed] defines callback action to submit form.
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: 'Sign in',
      onPressed: onPressed,
    );
  }
}
