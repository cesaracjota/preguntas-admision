import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.question,
    required this.correctAnswerIndex,
    required this.currentIndex,
    required this.selectedAnswerIndex,
    required this.onAnswerSelected,
  }) : super(key: key);

  final String question;
  final int correctAnswerIndex;
  final int currentIndex;
  final int? selectedAnswerIndex;
  final Function(int) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          onAnswerSelected(currentIndex);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selectedAnswerIndex == currentIndex
                  ? (isDarkMode ? Colors.white : primaryColor)
                  : (isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : primaryColor.withOpacity(0.3)),
            ),
          ),
          child: Row(
            children: [
              selectedAnswerIndex == currentIndex
                  ? Icon(
                      Icons.radio_button_checked,
                      color: isDarkMode ? null : primaryColor,
                    )
                  : Icon(
                      Icons.radio_button_off_outlined,
                      color: isDarkMode ? Colors.white.withOpacity(0.1) : primaryColor.withOpacity(0.5),
                    ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  question,
                  style: TextStyle(
                    color: selectedAnswerIndex == currentIndex
                        ? (isDarkMode ? Colors.white : primaryColor)
                        : (isDarkMode
                            ? Colors.white.withOpacity(0.4)
                            : primaryColor.withOpacity(0.8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
