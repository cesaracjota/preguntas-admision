import 'package:flutter/material.dart';
import 'question_model.dart';

class Topic {
  final String id; // Identificador único del tema
  final String title; // Título del tema
  final String subtitle;
  final String subCorto;
  final String imageUrl;
  final String avatarUrl;
  final Color brandColor;
  final String description; // Descripción del tema
  final List<Question> questions; // Lista de preguntas
  //  couse
  final int? courseId;

  Topic({
    required this.id,
    required this.title,
    required this.subtitle,
    this.courseId, 
    this.subCorto = '',
    this.imageUrl = 'assets/background_2.jpg',
    this.avatarUrl = 'assets/avatar.png',
    this.brandColor = Colors.indigo,
    required this.description,
    required this.questions,
  });
}
