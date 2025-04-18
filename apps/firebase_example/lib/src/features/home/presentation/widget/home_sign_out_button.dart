import 'package:firebase_example/src/features/authentication/authentication.dart';
import 'package:firebase_example/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSignOutButton extends HookConsumerWidget {
  const HomeSignOutButton({super.key});

  void _signOut(BuildContext context, WidgetRef ref) {
    if (context.mounted) {
      ref.read(authenticationControllerProvider.notifier).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomElevatedButton(
      label: 'Sign out',
      onPressed: () => _signOut(context, ref),
    );
  }
}
