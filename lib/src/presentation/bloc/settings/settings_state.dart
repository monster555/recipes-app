part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.theme = ThemeValues.light,
  });

  final ThemeValues theme;

  ThemeData get appTheme =>
      theme == ThemeValues.light ? AppTheme.lightTheme : AppTheme.darkTheme;

  SettingsState copyWith({
    ThemeValues? theme,
  }) =>
      SettingsState(
        theme: theme ?? this.theme,
      );

  @override
  List<Object> get props => [theme];

  @override
  String toString() => 'SettingsState { theme: $theme }';
}
