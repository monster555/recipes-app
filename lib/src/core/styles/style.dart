import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/styles/color_schemes.g.dart';

class AppTheme {
  AppTheme._();
  static const danger = Colors.red;

  static const borderRadius = BorderRadius.all(Radius.circular(12));

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      shadowColor: lightColorScheme.primary.withOpacity(0.1),
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
        foregroundColor: lightColorScheme.primary,
        shadowColor: lightColorScheme.primary.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: lightColorScheme.primary,
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColorScheme.primary,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: lightColorScheme.primary,
      ),
      selectedItemColor: lightColorScheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
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
        color: darkColorScheme.primary,
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
      backgroundColor: darkColorScheme.primary,
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
        color: darkColorScheme.primary,
      ),
      selectedItemColor: darkColorScheme.primary,
    ),
  );
}
