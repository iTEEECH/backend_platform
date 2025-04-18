import 'dart:ui';

import 'package:firebase_example/src/features/sign_in/presentation/widget/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatelessWidget {
  const SignInMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInBody(),
    );
  }
}
