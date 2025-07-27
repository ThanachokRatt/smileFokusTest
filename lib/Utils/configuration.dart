import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Configuration {
  static final Configuration _instance = Configuration._internal();

  factory Configuration() {
    return _instance;
  }

  Configuration._internal();

  //isLogin
  static Future<bool> get isLogin async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  static Future<void> setIsLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', value);
  }

  //point
  static Future<int> get point async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('point') ?? 0;
  }

  static Future<void> setPoint(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('point', value);
  }

  //userName
  static Future<String> get userName async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? '';
  }

  static Future<void> setName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', value);
  }
}
