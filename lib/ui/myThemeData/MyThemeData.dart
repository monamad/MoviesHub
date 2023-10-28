import 'package:flutter/material.dart';

class MyThemeData{
  static const Color lightprimary = Color(0xFF121312);
  static const Color secondaryprimary =  Color(0xFF1A1A1A);
  static const Color secondaryprimarycontainer =  Color(0xFF282A28);
  static const Color Onlightsecondaryprimary = Colors.white;
  static const Color selectedItemColor = Color(0xFFFFBB3B);


  static ThemeData Themes = ThemeData(

    scaffoldBackgroundColor: lightprimary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: secondaryprimary, // Set the background color here
      selectedItemColor: selectedItemColor,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 32, color: selectedItemColor),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: secondaryprimarycontainer,
      secondary: secondaryprimary,
      onPrimary: Onlightsecondaryprimary,
      onSecondary: Colors.white,
    ),
    useMaterial3: true,
  );
}