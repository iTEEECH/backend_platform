import 'package:firebase_example/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInForgotPasswordButton extends StatelessWidget {
  const SignInForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomTextButton(
        label: 'Forgot password ?',
        onPressed: () {},
      ),
    );
  }
}
