import 'package:flutter/material.dart';
import 'package:banco_preguntas_admision/providers/configuracion_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { Light, Dark }

class ThemeProvider with ChangeNotifier {
  ConfiguracionProvider? _configProvider;

  String? get fontFamily {
    return _configProvider?.fontFamily ?? _customFontFamily;
  }

  // Nuevo método para actualizar el configProvider
  void updateConfigProvider(ConfiguracionProvider configProvider) {
    _configProvider = configProvider;
    notifyListeners();
  }

  ThemeData? _themeData;
  late SharedPreferences _prefs;

  ThemeType _currentTheme = ThemeType.Light;

  ThemeProvider() {
    _initTheme();
  }

  void initTheme() {
    _initTheme().then((_) {
      notifyListeners();
    });
  }

  Future<void> _initTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getString('theme');
    _currentTheme = savedTheme == 'dark' ? ThemeType.Dark : ThemeType.Light;
    _themeData =
        _currentTheme == ThemeType.Light ? _lightThemeData() : _darkThemeData();
  }

  String get _customFontFamily => 'Roboto';

  ThemeData getTheme() => _themeData ?? _lightThemeData();

  ThemeData _lightThemeData() {
    final fontFamily = _configProvider?.fontFamily ?? _customFontFamily;
    final customTextTheme =
        _configProvider?.getCustomFontTextStyle(ThemeData.light().textTheme) ??
            ThemeData.light().textTheme;

    final themeColor = _configProvider?.themeColor ?? const Color(0xFFF64001d);

    return ThemeData.light().copyWith(
      useMaterial3: true,
      primaryColor: themeColor,
      colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
      appBarTheme: AppBarTheme(
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.black45,
        selectedIconTheme: IconThemeData(
            color: themeColor), // Color de fondo del icono seleccionado
      ),

      textTheme: customTextTheme,

      // Personaliza los colores de los botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            surfaceTintColor: themeColor),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        modalBackgroundColor: Colors.white,
        modalElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
      ),
      // Personaliza los colores de los botones de texto
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
      ),
      // Personaliza los colores de los botones de texto
      iconTheme: IconThemeData(
        color: themeColor,
      ),

      cardTheme: const CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
      ),

      dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: fontFamily,
            fontSize: 18,
          ),
          contentTextStyle: TextStyle(
              color: Colors.black, fontFamily: fontFamily, fontSize: 16),
          actionsPadding: const EdgeInsets.only(
            right: 20,
            bottom: 10,
          ),
          alignment: Alignment.center),
    );
  }

  ThemeData _darkThemeData() {
    final fontFamily = _configProvider?.fontFamily;
    final customTextTheme =
        _configProvider?.getCustomFontTextStyle(ThemeData.dark().textTheme) ??
            ThemeData.dark().textTheme;

    return ThemeData.dark().copyWith(
      useMaterial3: true,
      textTheme: customTextTheme,

      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white30,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white24,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),

      iconTheme: const IconThemeData(
        color: Colors.white,
      ),

      cardTheme: const CardTheme(
        color: Color.fromARGB(255, 38, 38, 38),
        surfaceTintColor: Color.fromARGB(255, 38, 38, 38),
        elevation: 0,
      ),

      // dialog
      dialogTheme: DialogTheme(
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        surfaceTintColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontFamily: fontFamily, fontSize: 18),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
      ),

      // showModalBottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF222222),
        modalBackgroundColor: Color(0xFF222222),
        modalElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
      ),

      // Personaliza los colores de drawer
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF222222),
        foregroundColor: Colors.white,
        scrolledUnderElevation: 1,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF222222),
        surfaceTintColor: Colors.black,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFFF64001d),
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          surfaceTintColor: Color(0xFFF64001d),
        ),
      ),
    );
  }

  Future<void> toggleTheme() async {
    _currentTheme =
        _currentTheme == ThemeType.Light ? ThemeType.Dark : ThemeType.Light;
    _themeData =
        _currentTheme == ThemeType.Light ? _lightThemeData() : _darkThemeData();
    notifyListeners();

    final themeValue = _currentTheme == ThemeType.Dark ? 'dark' : 'light';
    await _prefs.setString('theme', themeValue);
  }

  Future<void> aplyDarkMode() async {
    _currentTheme = ThemeType.Dark;
    _themeData = _darkThemeData();
    notifyListeners();

    const themeValue = 'dark';
    await _prefs.setString('theme', themeValue);
  }

  Future<void> aplyLightMode() async {
    _currentTheme = ThemeType.Light;
    _themeData = _lightThemeData();
    notifyListeners();

    const themeValue = 'light';
    await _prefs.setString('theme', themeValue);
  }
}
