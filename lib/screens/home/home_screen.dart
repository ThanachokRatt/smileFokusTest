import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(child: Text('Home Screen')),
    );
  }
}
