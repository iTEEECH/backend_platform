import 'package:supabase_example/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SignInSubtitle extends StatelessWidget {
  const SignInSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 12.0,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Let’s',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                  text: ' Sign In 👇',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        Text('Hey, enter your login to connect with Supabase.',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
