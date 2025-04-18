import 'package:flutter/material.dart';
import 'package:supabase_example/src/features/sign_in/sign_in.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        spacing: 24.0,
        children: <Widget>[
          SignInSubtitle(),
          SignInForm(),
        ],
      ),
    );
  }
}
