import 'package:banco_preguntas_admision/screens/sumary_screen.dart';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/answer_card.dart';
import 'dart:async';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;

  const QuestionScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<int?> userAnswers = [];
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int remainingTimeInSeconds = 600;
  int timerIndex = 600;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(widget.questions.length, null);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTimeInSeconds > 0) {
          remainingTimeInSeconds--;
        } else {
          timer.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => SummaryScreen(
                questions: widget.questions,
                userAnswers: userAnswers,
                remainingTimeInSeconds: remainingTimeInSeconds,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      userAnswers[questionIndex] = selectedAnswerIndex;
    });
  }

  void goToNextQuestion() {
    final question = widget.questions[questionIndex];
    if (selectedAnswerIndex == question.correctAlternativeIndex) {
      score++;
    }

    if (questionIndex < widget.questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      timer?.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SummaryScreen(
            questions: widget.questions,
            userAnswers: userAnswers,
            remainingTimeInSeconds: remainingTimeInSeconds,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[questionIndex];
    bool isLastQuestion = questionIndex == widget.questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pregunta ${widget.questions.indexOf(question) + 1}/${widget.questions.length}',
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(width: 5),
                Text(
                  '${(remainingTimeInSeconds / 60).floor()}:${(remainingTimeInSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.questionText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(
                        question.alternatives.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              if (selectedAnswerIndex == null) {
                                pickAnswer(index);
                              }
                            },
                            child: AnswerCard(
                              currentIndex: index,
                              question: question.alternatives[index],
                              selectedAnswerIndex: selectedAnswerIndex,
                              onAnswerSelected: (index) {
                                pickAnswer(index);
                              },
                              correctAnswerIndex:
                                  question.correctAlternativeIndex,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              selectedAnswerIndex != null
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 48.0),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 20.0,
            )),
          ),
          onPressed: selectedAnswerIndex != null ? goToNextQuestion : null,
          child: Text(
            isLastQuestion ? 'ENVIAR' : 'SIGUIENTE',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
