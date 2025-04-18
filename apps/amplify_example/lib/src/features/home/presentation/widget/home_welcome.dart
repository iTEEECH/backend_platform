import 'package:amplify_example/src/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeWelcome extends ConsumerWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider(s).
    final AsyncValue<String?> user = ref.watch(fetchUserProvider);

    // Content.
    return switch (user) {
      AsyncError(:final Object error) =>  Text(
        'Error $error 👋',
        style: TextStyle(fontSize: 20.0),
      ),
      AsyncData(value: final String? user) => Text(
        'Welcome $user 👋',
        style: TextStyle(fontSize: 20.0),
      ),
      _ => const CircularProgressIndicator.adaptive(),
    };
  }
}
