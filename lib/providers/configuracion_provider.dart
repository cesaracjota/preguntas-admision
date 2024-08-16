import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracionProvider with ChangeNotifier {
  String _fontFamily = 'Roboto'; // Fuente de texto predeterminada
  Color _themeColor = Color(0xFFF64001d);

  String get fontFamily => _fontFamily;
  Color get themeColor => _themeColor;

  ConfiguracionProvider() {
    initFontFamily();
    initThemeColor();
  }

  Future<void> initFontFamily() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFontFamily = prefs.getString('fontFamily');
    if (savedFontFamily != null) {
      _fontFamily = savedFontFamily;
    }
  }

  Future<void> initThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeColor = prefs.getInt('themeColor');
    if (savedThemeColor != null) {
      _themeColor = Color(savedThemeColor);
    }
  }

  Future<void> changeFontFamily(String fontFamily) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fontFamily', fontFamily);
    _fontFamily = fontFamily;
    notifyListeners();
  }

  Future<void> resetFontFamily() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('fontFamily');
    _fontFamily = 'Roboto'; // Fuente de texto predeterminada
    notifyListeners();
  }

  Future<void> changeThemeColor(Color themeColor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeColor', themeColor.value);
    _themeColor = themeColor;
    notifyListeners();
  }

  Future<void> resetThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('themeColor');
    _themeColor = Color(0xFFF64001d); // Color predeterminado
    notifyListeners();
  }

  // Método para obtener el estilo de texto personalizado
  TextTheme getCustomFontTextStyle(TextTheme baseStyle) {
    return baseStyle.copyWith(
      displayLarge: baseStyle.bodySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      displayMedium: baseStyle.bodySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      displaySmall: baseStyle.bodySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodySmall: baseStyle.bodySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodyMedium: baseStyle.bodyMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodyLarge: baseStyle.bodyLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleSmall: baseStyle.titleSmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleMedium: baseStyle.titleMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleLarge: baseStyle.titleLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelSmall: baseStyle.labelSmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelMedium: baseStyle.labelMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelLarge: baseStyle.labelLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
    );
  }
}
