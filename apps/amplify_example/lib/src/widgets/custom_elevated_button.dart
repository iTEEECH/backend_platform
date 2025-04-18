import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomElevatedButton extends HookConsumerWidget {
  /// [label] defines the button's display label.
  final String label;

  /// [onPressed] defines callback custom action.
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Style.
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      minimumSize: const Size(180.0, 60.0),
      maximumSize: const Size(240.0, 80.0),
      textStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );

    // Content.
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
