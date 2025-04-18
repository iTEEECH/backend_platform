import 'package:amplify_example/src/features/home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTitle(),
      body: HomeBody(),
    );
  }
}
