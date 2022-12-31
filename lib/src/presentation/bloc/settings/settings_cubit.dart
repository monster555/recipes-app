import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/core/styles/style.dart';
import 'package:recipes_app/src/domain/entities/enums.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  ThemeValues get brightness => state.theme;
  bool get isDark => brightness == ThemeValues.dark;
  String get mapStyle =>
      'mapbox://styles/mapbox/${isDark ? 'dark-v10' : 'light-v10'}';

  bool _isDark = false;

  void switchTheme() {
    _isDark = !_isDark;
    setTheme(isDark: _isDark);
  }

  void setDarkTheme() {
    _isDark = true;
    setTheme(isDark: _isDark);
  }

  void setLightTheme() {
    _isDark = false;
    setTheme(isDark: _isDark);
  }

  void setTheme({required bool isDark}) {
    emit(
      SettingsState(
        theme: isDark ? ThemeValues.dark : ThemeValues.light,
      ),
    );
  }
}
