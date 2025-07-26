import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GetString.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryBlue),
      ),
      home: LoginScreen(),
    );
  }
}
