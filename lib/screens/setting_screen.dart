import 'package:flutter/material.dart';
import 'package:banco_preguntas_admision/providers/configuracion_provider.dart';
import 'package:banco_preguntas_admision/providers/theme_provider.dart';
import 'package:banco_preguntas_admision/widgets/theme_color_picker_modal.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _fontFamily = 'Roboto';
  Color _primaryColor = const Color(0xfff64001d);

  @override
  void initState() {
    super.initState();
    final configProvider =
        Provider.of<ConfiguracionProvider>(context, listen: false);
    _fontFamily = configProvider.fontFamily;
    _primaryColor = configProvider.themeColor;
  }

  Future<void> _verModalAcercaDeLaApp(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset(
            'assets/logo.png',
            width: 80,
            height: 80,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Preguntas de Admisión PreU',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Versión 1.0.0',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Desarrollado por:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                'cesaracjota@gmail.com',
                style: TextStyle(fontSize: 16, color: _primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Esta aplicación fue desarrollada con el fin de facilitar a una cierta cantidad de preguntas de admisión para diferentes universidades del Perú y así poder comprobar en que estado está el aprendizaje de cada uno.',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  _showFontFamilyDialog(
      BuildContext context, ConfiguracionProvider configProvider) {
    final List<String> fontFamilies = [
      'Roboto',
      'Raleway',
      'Poppins',
      'Dosis',
      'EthosNova',
      'Gotham',
      'Kreadon'
    ];

    String selectedFontFamily = configProvider.fontFamily;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Seleccionar Fuente de Texto',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fontFamilies.length,
                    itemBuilder: (context, index) {
                      final fontFamily = fontFamilies[index];
                      bool isSelected = selectedFontFamily == fontFamily;

                      return GestureDetector(
                        onTap: () {
                          configProvider.changeFontFamily(fontFamily);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isSelected
                                ? _primaryColor.withOpacity(0.2)
                                : null,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.font_download,
                                color: isSelected ? _primaryColor : null,
                                size: 50, // Tamaño del icono más pequeño
                              ),
                              const SizedBox(height: 8),
                              Text(
                                fontFamily,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected ? _primaryColor : null,
                                  fontFamily: fontFamily,
                                  fontWeight: isSelected
                                      ? FontWeight.w500
                                      : FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void toggleDarkMode() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.toggleTheme();
  }

  _showThemeColorPickerModal(context, configProvider) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ThemeColorPickerModal(
          colorOptions: const [
            Color(0xfff117864),
            Color(0xfff9a7d0a),
            Color(0xfff0a4d68),
            Color(0xfff64001d),
            Color(0xfff900c3f),
            Color(0xFF820000),
            Color(0xfffcf0000),
            Color(0xfff0d335d),
            Color(0xfff35155d),
            Colors.indigo,
            Colors.brown,
            Colors.pink,
          ],
          onSelectColor: (Color selectedColor) {
            configProvider.changeThemeColor(selectedColor);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.getTheme().brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Configuración',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text("CONFIGURACIÓN GLOBAL"),
          ),
          Card(
            elevation: 1,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Modo oscuro'),
                  trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        toggleDarkMode();
                      },
                      activeColor: Colors.white,
                      activeTrackColor: _primaryColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade600),
                ),
                Consumer<ConfiguracionProvider>(
                  builder: (context, configProvider, _) {
                    _fontFamily = configProvider.fontFamily;
                    _primaryColor = configProvider.themeColor;
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.color_lens),
                          title: const Text('Color de tema'),
                          trailing: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () => _showThemeColorPickerModal(
                              context, configProvider),
                        ),
                        ListTile(
                          leading: const Icon(Icons.font_download),
                          title: const Text('Fuente de texto'),
                          trailing: Text(
                            _fontFamily,
                            style: TextStyle(
                              color: _primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () =>
                              _showFontFamilyDialog(context, configProvider),
                        ),
                      ],
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cloud_download_rounded),
                  title: const Text('Administrar descargas'),
                  onTap: () {
                    // Lógica para redirigir a la página de calificación de la aplicación
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.local_grocery_store),
                  title: const Text('Suscripciones'),
                  onTap: () {
                    // Lógica para mostrar información sobre la aplicación
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text("CONFIGURACIÓN GENERAL"),
          ),
          Card(
            elevation: 1,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Calificar la aplicación'),
                  onTap: () {
                    //
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('Acerca de esta aplicación'),
                  onTap: () {
                    _verModalAcercaDeLaApp(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
