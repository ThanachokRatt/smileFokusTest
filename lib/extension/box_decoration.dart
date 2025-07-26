import 'package:flutter/material.dart';

extension CustomBoxDecoration on BoxDecoration {
  static BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      border: Border.all(color: Colors.grey.shade50),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: -2,
          blurRadius: 1,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(-2, 4),
        ),
      ],
    );
  }
}
