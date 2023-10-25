import 'package:flutter/material.dart';

abstract class Palette {
  // static const primary = Color(0xFF7E1946);
  // static const primary = Color(0xFF345C29);
  static const secondary = Color(0xFFFDEBD8);
  static const primary = Color(0xFF6C6EA0);
  static const blueLight = Color(0xFFE3EAF2);
  static const green = Color(0xFF426D36);
  static const background = Color(0xFFFBF9F5);
  static const chat = Color(0xFF2152D8);

  static const gray1 = Color(0xFF333333);
  static const gray2 = Color(0xFF4F4F4F);
  static const gray3 = Color(0xFF828282);
  static const gray4 = Color(0xFFBDBDBD);
  static const gray5 = Color(0xFFE0E0E0);
  static const gray6 = Color(0xFFF2F2F2);
  static const culture = Color(0xFFEFF1F3);

  // static const accent = Color(0xFFC2DDBB);
  static const accentLight = Color(0xFFFDEBD8);
}

extension ToMaterialColor on Color {
  MaterialStateProperty<Color> get toMaterialStateProperty =>
      MaterialStateProperty.all<Color>(this);

  MaterialColor get toMaterial => _toMaterial(this);
  MaterialColor _toMaterial(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color,
        100: color,
        200: color,
        300: color,
        400: color,
        500: color,
        600: color,
        700: color,
        800: color,
        900: color,
      },
    );
  }
}

extension ToMaterial<T> on T {
  MaterialStateProperty<T> get toMaterialStateProperty =>
      MaterialStateProperty.all<T>(this);
}

extension ToMaterialTextStyle on TextStyle {
  MaterialStateProperty<TextStyle> get toMaterialStateProperty =>
      MaterialStateProperty.all<TextStyle>(this);
}
