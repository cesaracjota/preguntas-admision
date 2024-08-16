import 'package:banco_preguntas_admision/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:banco_preguntas_admision/providers/configuracion_provider.dart';
import 'package:banco_preguntas_admision/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final configProvider = ConfiguracionProvider();
  final themeProvider = ThemeProvider();
  themeProvider.updateConfigProvider(configProvider);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(
          value: themeProvider,
        ),
        ChangeNotifierProvider<ConfiguracionProvider>.value(
          value: configProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        themeProvider.initTheme();
        return MaterialApp(
          title: 'Preguntas de Admisión',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme(),
          themeAnimationDuration: const Duration(milliseconds: 0),
          themeAnimationCurve: Curves.linear,
          home: const AuthScreen(),
        );
      },
    );
  }
}
