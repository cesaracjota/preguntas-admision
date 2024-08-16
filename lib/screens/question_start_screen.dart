import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/configuracion_provider.dart';

class QuestionStartScreen extends StatelessWidget {
  final String examTitle;
  final String examDescription;
  final String courseLogo;
  final int totalQuestions;
  final VoidCallback onStartPressed;

  const QuestionStartScreen({
    Key? key,
    required this.examTitle,
    required this.examDescription,
    required this.courseLogo,
    required this.totalQuestions,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configProvider =
        Provider.of<ConfiguracionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Empezar Evaluación'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 6,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    courseLogo,
                    width: 100,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: configProvider.fontFamily,
                  ),
                  children: [
                    const TextSpan(
                        text: 'Pon a prueba tu aprendizaje en el tema de ',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(
                      text: examTitle,
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    minLeadingWidth: lerpDouble(0, 0, 0.5),
                    minVerticalPadding: lerpDouble(0, 0, 0.5),
                    leading: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'La evaluación consta de $totalQuestions preguntas.',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: lerpDouble(0, 0, 0.5),
                    minVerticalPadding: lerpDouble(0, 0, 0.1),
                    leading: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    title: const Text(
                      'No te preocupes, puedes intentar pasar la evaluación tantas veces como quieras.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: lerpDouble(0, 0, 0.5),
                    minVerticalPadding: lerpDouble(0, 0, 0.5),
                    leading: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    title: const Text(
                      'Si fallas, puedes volver a intentarlo.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: onStartPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'EMPEZAR LA EVALUACIÓN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Seguir Estudiando',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
