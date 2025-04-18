import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_example/src/features/authentication/application/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeWelcome extends ConsumerWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider(s).
    final User? user = ref.watch(authenticationControllerProvider.notifier).user;

    // Content.
    return Text(
      'Welcome ${user?.email} 👋',
      style: TextStyle(fontSize: 20.0),
    );
  }
}
