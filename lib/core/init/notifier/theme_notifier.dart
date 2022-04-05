import 'package:flutter/material.dart';

import '../../constant/enum/app_theme_enum.dart';
import '../../constant/enum/preferences_keys_enum.dart';
import '../cache/cache_manager.dart';
import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = CacheManager.instance.getBoolValue(PrefsKey.THEME)
      ? AppThemeDark.dark().theme
      : AppThemeLight.light().theme;

  final ThemeData _darkTheme = AppThemeDark.dark().theme;
  final ThemeData _lightTheme = AppThemeLight.light().theme;

  ThemeData get currentTheme => _currentTheme;
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  void changeTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = _lightTheme;
    } else {
      _currentTheme = _darkTheme;
    }
    notifyListeners();
  }
}
