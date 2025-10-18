import 'package:flutter/material.dart';

/// 🎨 Warna utama tema Kamus Arab
const kPrimary = Color(0xFF2196F3); // biru
const kSecondary = Color(0xFF26C6DA); // cyan lembut
const kBackground = Color(0xFFF3F5F9);
const kCard = Color(0xFFFFFFFF);
const kShadow = Color(0x1A000000); // transparan
const kTextDark = Color(0xFF222831);
const kTextLight = Color(0xFF757575);

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
