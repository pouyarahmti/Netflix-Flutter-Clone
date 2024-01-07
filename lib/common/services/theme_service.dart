import 'package:flutter/material.dart';
import 'package:imdb_clone/common/theme/default_theme.dart';

import 'logger_service.dart';

class ThemeService {
  static final ThemeService _instance = ThemeService._internal();

  factory ThemeService() {
    return _instance;
  }

  ThemeService._internal() {
    LoggerService().simple("Theme Service Initialized");
  }

  final Brightness _currentBrightness = Brightness.light;
  final DefaultTheme _currentTheme = DefaultTheme();

  DefaultTheme get currentTheme => _currentTheme;
  Brightness get currentBrightness => _currentBrightness;

  ThemeData getThemeData([Brightness brightness = Brightness.light]) {
    ColorScheme colorScheme = _currentTheme.colorScheme;
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.background,
      cardColor: colorScheme.surface,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.surface,
      ),
      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.onPrimary,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      applyElevationOverlayColor: false,
    );
  }
}
