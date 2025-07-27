import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/configuration.dart';
import 'package:smile_fokus_test/main.dart';

class AuthRepository {
  ///Sign out function
  static signOut(BuildContext context) async {
    await Configuration.setIsLogin(false);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return const MyApp(isLogin: false);
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}
