import 'topic_model.dart';

class Course {
  final int id; // Identificador único de la materia
  final String title; // Título de la materia
  final String description; // Descripción de la materia
  final String image; // Ruta de la imagen de la materia
  final List<Topic> topics; // Lista de temas

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.topics,
  });
}
