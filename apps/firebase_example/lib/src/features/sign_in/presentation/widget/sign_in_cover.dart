import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SignInCover extends StatelessWidget {

  static const List<String> _covers = [
    'assets/images/cover_1.jpg',
    'assets/images/cover_2.jpg',
    'assets/images/cover_3.jpg',
  ];

  static final String _cover = _covers[Random().nextInt(3)];

  const SignInCover({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(_cover),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.25),
            ),
            child: Center(
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
