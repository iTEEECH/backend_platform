import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextButton extends HookConsumerWidget {
  /// [label] defines the button's display label.
  final String label;

  /// [onPressed] defines callback custom action.
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Style.
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Colors.blueAccent,
      textStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
    );

    // Content.
    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
