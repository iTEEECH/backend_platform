import 'package:flutter/material.dart';
import 'package:amplify_example/src/core/constants/constants.dart';

class SignInTitle extends StatelessWidget implements PreferredSizeWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(Constants.kTitle),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
