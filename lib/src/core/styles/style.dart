// ignore_for_file: deprecated_member_use
// This should be removed when the migration is complete.

import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/styles/color_schemes.g.dart';

class AppTheme {
  AppTheme._();
  static const danger = Colors.red;
  static const mainColor = Colors.teal;
  static Color mainColorDark = Colors.teal.shade400;

  static const borderRadius = BorderRadius.all(Radius.circular(12));

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      color: Colors.white,
      shadowColor: mainColor.withOpacity(0.1),
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 20,
      ),
    ),
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,
    cardTheme: CardTheme(
      elevation: 12,
      shadowColor: lightColorScheme.shadow.withOpacity(0.15),
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: mainColor,
        shadowColor: mainColor.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(
        color: mainColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColorScheme.outline,
          width: 1.5,
        ),
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: lightColorScheme.outline.withOpacity(.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColorScheme.error,
          width: 1.5,
        ),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColorScheme.error,
          width: 1.5,
        ),
        borderRadius: borderRadius,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: mainColor,
      elevation: 12,
    ),
    chipTheme: const ChipThemeData(
      showCheckmark: true,
      labelStyle: TextStyle(
        fontSize: 12,
        color: Colors.black87,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: mainColor,
      ),
      selectedItemColor: mainColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    colorScheme: darkColorScheme,
    cardTheme: CardTheme(
      color: lightColorScheme.primary,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: mainColorDark,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkColorScheme.outline,
        ),
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: darkColorScheme.outline.withOpacity(.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkColorScheme.error,
          width: 1.5,
        ),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkColorScheme.error,
          width: 1.5,
        ),
        borderRadius: borderRadius,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: mainColorDark,
      foregroundColor: Colors.white,
      elevation: 12,
    ),
    chipTheme: const ChipThemeData(
      showCheckmark: true,
      iconTheme: IconThemeData(
        size: 12,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: 12,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: mainColorDark,
      ),
      selectedItemColor: mainColorDark,
    ),
  );
}
