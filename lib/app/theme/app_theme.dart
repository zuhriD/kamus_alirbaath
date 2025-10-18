import 'package:flutter/material.dart';

const kPrimary = Color(0xFF1976D2);
const kSecondary = Color(0xFF64B5F6);
const kBackground = Color(0xFFF8F9FB);
const kTextDark = Color(0xFF212121);
const kCard = Color(0xFFFFFFFF);
const kShadow = Color(0x1A000000);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: kBackground,
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: kTextDark),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: kTextDark,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimary,
    brightness: Brightness.dark,
  ),
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
