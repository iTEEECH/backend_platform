import 'package:firebase_example/src/features/home/home.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 24.0,
        children: <Widget>[
          HomeWelcome(),
          HomeSignOutButton(),
        ],
      ),
    );
  }
}
