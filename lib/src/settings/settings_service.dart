import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeMode = prefs.getString('themeMode');

      if (themeMode == null) return ThemeMode.system;

      return ThemeMode.values.byName(themeMode);
    } catch (_) {
      return ThemeMode.dark;
    }
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', theme.name);
  }
}
