import 'dart:math';
import 'dart:ui';

import 'package:firebase_example/src/features/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class SignInDesktopScreen extends StatelessWidget {
  const SignInDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: SignInCover(),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: SignInBody(),
          ),
        ],
      ),
    );
  }
}
