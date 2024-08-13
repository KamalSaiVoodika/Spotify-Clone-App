import 'package:avis/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.4,
          )),
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.4,
          )),
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
