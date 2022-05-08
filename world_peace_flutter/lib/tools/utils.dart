import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef IntCallback = Function(int);
typedef BoolCallback = Function(bool);
typedef DoubleCallback = Function(double);
typedef StringCallback = Function(String);
typedef FutureStringCallback = Future<String> Function();

double get screenWidth => window.physicalSize.width / window.devicePixelRatio;
double get screenHeight => window.physicalSize.height / window.devicePixelRatio;

class AppColors {
  static const dark = Colors.black87;
  static const white = Colors.white;
  static const clear = Colors.transparent;
  static const divider = Color(0xffd9d9d9);
  static const cancel = Color(0xFFefefef);
  static const theme = Color.fromRGBO(90, 200, 250, 1);
  static const themeII = Color.fromRGBO(48, 209, 88, 1);
  static const themeBg = Color.fromRGBO(250, 250, 250, 1);
}

class Constants {
  static const iconFontFamily = 'appIconFont';
  static const dividerWidth = 0.5;
}

// '#FFE82A' -> 0xFFFFE82A
getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) hexColor = "FF" + hexColor;
  return int.parse(hexColor, radix: 16);
}

prt(value) {
  if (kDebugMode) {
    print(value);
  }
}
