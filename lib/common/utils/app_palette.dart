// ignore_for_file: unused_field

import 'package:flutter/material.dart';

abstract class AppPalette {
  static const Color transparent = Colors.transparent;

  // Primary Colors
  static const Color primaryBase = Color(0xFF1C9DEB);
  static const Color primaryLight = Color(0xFF51CAFE);
  static const Color primaryDark = Color(0xFF1A73E8);
  static const Color primaryDark40 = Color(0xBB51CAFE);
  static const Color primaryDarkBlue = Color(0xFF0048CC);

  // Grey Colors
  static const Color grey60 = Color(0xAA292C29);
  static const Color grey40 = Color(0xFFD9D9D9);

  // Background Colors
  static const Color backgroundBase = Colors.white;
  static const Color backgroundDark = Color(0xFF454646);

  // Black Colors
  static const Color blackBase = Color(0xFF000000);
  static const Color black50 = Color(0xFF454646);
  static const Color black200 = Color(0xFF454646);

  // Blue Colors
  static const Color blueBase = Colors.blue;
  static const Color darkBlue = Color(0xFF004492);
  static const Color dustBlue = Color(0xFF859ED1);
  static const Color royalBlue = Color(0xFF126292);

  // Gradient Colors
  static const Gradient gradientPrimary = LinearGradient(
    colors: [primaryLight, primaryBase],
  );

  // Green Colors
  static const Color greenBase = Colors.green;
  static const Color greenLight = Color(0xFFA5D6A7);
  static const Color greenDark = Color(0xFF388E3C);

  // Pink Colors
  static const Color pinkLight = Color(0xFFF7E6E6);

  // Red Colors
  static const Color redBase = Color(0xFFFA0000);
  static const Color redLight = Color(0xFFFA9884);
  static const Color redDark = Color(0xFFC62828);
  static const Color redDanger = Color(0xF3F32013);

  // Orange Colors
  static const Color orangeBase = Color(0xffe24501);

  // White Colors
  static const Color whiteBase = Color(0xFFFFFFFF);
  static const Color white50 = Color(0xAAFFFFFF);
}
