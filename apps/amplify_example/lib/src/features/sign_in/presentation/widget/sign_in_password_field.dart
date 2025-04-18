import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:amplify_example/src/core/utils/utils.dart';

class SignInPasswordField extends HookWidget {
  final TextEditingController controller;

  const SignInPasswordField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Hook(s).
    final ValueNotifier<bool> obscureText = useState<bool>(true);

    // Style.
    final InputDecoration decoration = InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent)
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      hintText: 'Password',
      icon: Icon(Icons.lock, color: Colors.grey,),
      suffixIcon: GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Icon(
            obscureText.value ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        ),
      ),
    );

    // Content.
    return TextFormField(
      controller: controller,
      obscureText: obscureText.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) => Validators.password(value),
      decoration: decoration,
    );
  }
}
