import 'package:banco_preguntas_admision/providers/theme_provider.dart';
import 'package:banco_preguntas_admision/screens/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/topic_model.dart';
import '../widgets/course_card.dart';
import '../data/data.dart';
import 'question_screen.dart';
import 'question_start_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleDarkMode() {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.toggleTheme();
    }

    void _navigateToQuestionScreen(Topic topic, int questionIndex) {
      if (topic.questions.isNotEmpty) {
        final questions = topic.questions;
        // course.id == topic.courseId
        final course =
            courses.firstWhere((element) => element.id == topic.courseId);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionStartScreen(
              examTitle: topic.title,
              examDescription: 'Realiza el examen del curso ${course.title}',
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
            content: Text('No hay preguntas suficientes para este tema.'),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADMISIÓN UNSA",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              setState(() => isDarkMode = !isDarkMode);
              toggleDarkMode();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'CURSOS DISPONIBLES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicsScreen(course: course),
                          ),
                        );
                      },
                      child: CourseCard(
                        courseTitle: course.title,
                        courseImage: course.image,
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'BALOTAS POPULARES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: popularTopics.asMap().entries.map((entry) {
                final index = entry.key;
                final topic = entry.value;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      topic.id,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Badge.count(
                    count: topic.questions.length,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    topic.title,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    topic.subtitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    _navigateToQuestionScreen(topic, index);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
