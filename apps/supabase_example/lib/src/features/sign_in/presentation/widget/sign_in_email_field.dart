import 'package:flutter/material.dart';
import 'package:supabase_example/src/core/utils/utils.dart';

class SignInEmailField extends StatelessWidget {
  /// [controller] defines text controller for email field.
  final TextEditingController controller;

  const SignInEmailField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Style.
    final InputDecoration decoration = InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      hintText: 'Email',
      icon: Icon(Icons.email, color: Colors.grey,),
    );

    // Content.
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) => Validators.email(value),
      decoration: decoration,
    );
  }
}