import 'package:banco_preguntas_admision/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDarkMode = false;

  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const SettingScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Theme.of(context).primaryColor.withOpacity(0.8),
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.school,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.school_outlined,
            ),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.search_outlined,
            ),
            label: 'Busqueda',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: 'Configuracion',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
