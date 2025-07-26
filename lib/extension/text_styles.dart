import 'package:flutter/material.dart';

extension SetStyle on TextStyle {
  static TextStyle sarabunBold(double fontSize) {
    return TextStyle(fontFamily: 'saraBun-bold', fontSize: fontSize);
  }

  static TextStyle sarabunSemiBold(double fontSize) {
    return TextStyle(fontFamily: 'saraBun-semiBold', fontSize: fontSize);
  }

  static TextStyle sarabunRegular(double fontSize) {
    return TextStyle(fontFamily: 'saraBun-regular', fontSize: fontSize);
  }
}
