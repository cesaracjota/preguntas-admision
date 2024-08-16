import 'package:banco_preguntas_admision/models/topic_model.dart';
import 'package:banco_preguntas_admision/screens/question_screen.dart';
import 'package:banco_preguntas_admision/screens/question_start_screen.dart';
import 'package:flutter/material.dart';
import '../models/course_model.dart'; // Asegúrate de importar el modelo adecuado

class TopicsScreen extends StatelessWidget {
  final Course course;

  const TopicsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    void _navigateToQuestionScreen(Topic topic, int questionIndex) {
      if (questionIndex >= 0 && questionIndex < topic.questions.length) {
        final questions = topic.questions;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionStartScreen(
              examTitle: topic.title,
              examDescription: 'Realiza la evaluación del curso ${course.title}',
              totalQuestions: questions.length,
              courseLogo: course.image,
              onStartPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      questions: questions,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No hay preguntas disponibles para este tema.'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Curso de ${course.title}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //
                },
                icon: const Icon(Icons.search),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  // Lógica para el botón de opciones
                },
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
              ),
            ],
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final topic = course.topics[index]; // Obtener el tema actual
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      topic.subCorto,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    topic.title,
                  ),
                  subtitle: Text(topic.subtitle),
                  onTap: () {
                    _navigateToQuestionScreen(topic, index);
                  },
                );
              },
              childCount: course.topics.length,
            ),
          ),
        ],
      ),
    );
  }
}
