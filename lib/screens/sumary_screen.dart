import 'package:banco_preguntas_admision/models/question_model.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final List<Question> questions;
  final List<int?> userAnswers;
  final int remainingTimeInSeconds;

  const SummaryScreen({
    super.key,
    required this.questions,
    required this.userAnswers,
    required this.remainingTimeInSeconds,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAlternativeIndex) {
        correctAnswers++;
      }
    }

    double percentage = (correctAnswers / questions.length) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Respuestas'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nota final: $correctAnswers de ${questions.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Porcentaje de aciertos: ${percentage.toStringAsFixed(2)}%',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Tiempo restante: ${(remainingTimeInSeconds / 60).floor()}:${(remainingTimeInSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        semanticsLabel:
                            'Porcentaje de aciertos: ${percentage.toStringAsFixed(2)}%',
                        value: percentage / 100,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          percentage < 50 ? '😢' : '😎',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                Question question = questions[index];
                bool isCorrect =
                    userAnswers[index] == question.correctAlternativeIndex;
                return ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium!,
                        text: question.questionText,
                      ),
                    ),
                    leading: isCorrect ? buildCorrectIcon() : buildWrongIcon(),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Respuesta correcta: ${question.alternatives[question.correctAlternativeIndex]}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Tu respuesta: ${question.alternatives[userAnswers[index]!]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green : Colors.red),
                        ),
                      ],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 1);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).primaryColor,
            ),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 0)),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 16.0,
            )),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text(
            'VOLVER A LOS TEMAS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
