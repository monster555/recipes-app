import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/styles/custom_color.g.dart';

/// A class that provides static methods for generating light and dark
/// [ThemeData] objects.
class AppTheme {
  /// Private constructor to prevent instantiation of this class.
  ///
  /// This class only provides static methods and should not be instantiated.
  AppTheme._();

  /// Returns a light [ThemeData] object configured with the specified
  /// [lightScheme] and custom color extensions.
  ///
  /// The [fontFamily] property is set to 'Poppins'.
  static ThemeData lightTheme(ColorScheme lightScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: lightScheme,
        extensions: [lightCustomColors],
        fontFamily: 'Poppins',
      );

  /// Returns a dark [ThemeData] object configured with the specified
  /// [darkScheme] and custom color extensions.
  ///
  /// The [fontFamily] property is set to 'Poppins'.
  static ThemeData darkTheme(ColorScheme darkScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: darkScheme,
        extensions: [darkCustomColors],
        fontFamily: 'Poppins',
      );
}
