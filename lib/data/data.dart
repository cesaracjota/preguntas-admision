import 'package:banco_preguntas_admision/data/geografia/balota_1.dart';

import '../models/course_model.dart';
import '../models/question_model.dart';
import '../models/topic_model.dart';
import 'historia/hbalotas.dart';

final List<Question> preguntasHistoriaBalota2 = [
  Question(
    id: 1,
    questionText:
        '¿Qué período de la prehistoria se caracteriza por el uso de herramientas de piedra tallada?',
    difficulty: 'Fácil',
    alternatives: [
      'Paleolítico',
      'Neolítico',
      'Edad de los Metales',
      'Mesolítico',
    ],
    correctAlternativeIndex: 0,
  ),
  Question(
    id: 2,
    questionText:
        '¿Cuál de las siguientes civilizaciones antiguas se desarrolló a lo largo del río Nilo?',
    difficulty: 'Fácil',
    alternatives: ['Sumerios', 'Mayas', 'Egipcios', 'Romanos'],
    correctAlternativeIndex: 2,
  ),
  Question(
    id: 3,
    questionText:
        '¿Cuál de las siguientes afirmaciones es correcta acerca del Renacimiento?',
    difficulty: 'Intermedio',
    alternatives: [
      'Fue un movimiento cultural que se originó en Asia',
      'Se caracterizó por un fuerte enfoque en la teología',
      'No tuvo impacto en el arte y la ciencia',
      'Promovió la exploración de la creatividad y el conocimiento humano'
    ],
    correctAlternativeIndex: 3,
  ),
  Question(
    id: 4,
    questionText:
        '¿Qué evento histórico marcó el fin de la Edad Media y el comienzo de la Edad Moderna en Europa?',
    difficulty: 'Intermedio',
    alternatives: [
      'La caída del Imperio Romano',
      'La Revolución Industrial',
      'La Revolución Francesa',
      'El descubrimiento de América'
    ],
    correctAlternativeIndex: 3,
  ),
  Question(
    id: 5,
    questionText: '¿Quién fue el líder de la Revolución Rusa de 1917?',
    difficulty: 'Intermedio',
    alternatives: [
      'Mao Zedong',
      'Josef Stalin',
      'Vladimir Lenin',
      'León Trotsky'
    ],
    correctAlternativeIndex: 2,
  ),
  Question(
    id: 6,
    questionText:
        '¿Qué imperio fue conocido por su amplio sistema de caminos llamado "la Ruta de la Seda"?',
    difficulty: 'Difícil',
    alternatives: [
      'Imperio Romano',
      'Imperio Mongol',
      'Imperio Bizantino',
      'Imperio Persa'
    ],
    correctAlternativeIndex: 1,
  ),
  Question(
    id: 7,
    questionText:
        '¿Qué documento histórico estableció los principios de igualdad, libertad y fraternidad durante la Revolución Francesa?',
    difficulty: 'Difícil',
    alternatives: [
      'Declaración de Derechos de Virginia',
      'Carta Magna',
      'Declaración de Independencia de los Estados Unidos',
      'Declaración de los Derechos del Hombre y del Ciudadano'
    ],
    correctAlternativeIndex: 3,
  ),
  Question(
    id: 8,
    questionText:
        '¿Cuál de los siguientes filósofos fue un defensor del empirismo?',
    difficulty: 'Difícil',
    alternatives: [
      'René Descartes',
      'Immanuel Kant',
      'John Locke',
      'Friedrich Nietzsche'
    ],
    correctAlternativeIndex: 2,
  ),
  Question(
    id: 9,
    questionText:
        '¿Qué imperio fue conocido por construir la Gran Muralla para protegerse de invasiones?',
    difficulty: 'Difícil',
    alternatives: [
      'Imperio Romano',
      'Imperio Persa',
      'Imperio Mongol',
      'Imperio Chino'
    ],
    correctAlternativeIndex: 3,
  ),
  Question(
    id: 10,
    questionText:
        '¿Quién fue el líder de la Revolución Cubana que derrocó al dictador Fulgencio Batista en 1959?',
    difficulty: 'Difícil',
    alternatives: [
      'Hugo Chávez',
      'Fidel Castro',
      'Augusto Pinochet',
      'Evo Morales'
    ],
    correctAlternativeIndex: 1,
  ),
  Question(
    id: 11,
    questionText:
        '¿Cuál de las siguientes opciones describe mejor la teoría de la evolución de Charles Darwin?',
    difficulty: 'Fácil',
    alternatives: [
      'La teoría de la generación espontánea',
      'La teoría de la relatividad',
      'La teoría del Big Bang',
      'La teoría de la evolución por selección natural',
      'La teoría del flogisto'
    ],
    correctAlternativeIndex: 3,
  ),
  Question(
    id: 12,
    questionText: '¿En qué período histórico ocurrió la Revolución Francesa?',
    difficulty: 'Intermedio',
    alternatives: [
      'Siglo XV',
      'Siglo XVII',
      'Siglo XVIII',
      'Siglo XIX',
      'Siglo XX'
    ],
    correctAlternativeIndex: 2,
  ),
  Question(
    id: 13,
    questionText:
        '¿Cuál fue el imperio que conquistó gran parte de Europa en el siglo XIX bajo el liderazgo de Napoleón Bonaparte?',
    difficulty: 'Intermedio',
    alternatives: [
      'Imperio Romano',
      'Imperio Bizantino',
      'Imperio Mongol',
      'Imperio Inca',
      'Imperio Napoleónico'
    ],
    correctAlternativeIndex: 4,
  ),
  Question(
    id: 14,
    questionText:
        '¿Cuál de las siguientes figuras históricas fue líder de la lucha por la independencia de la India frente al dominio británico?',
    difficulty: 'Intermedio',
    alternatives: [
      'Mao Zedong',
      'Nelson Mandela',
      'Simón Bolívar',
      'Mahatma Gandhi',
      'Winston Churchill'
    ],
    correctAlternativeIndex: 3,
  ),
];



// Lista de preguntas para un tema específico
final List<Question> preguntasBiologia = [
  Question(
    id: 1,
    questionText: '¿Cómo funciona...?',
    difficulty: 'Intermedio',
    alternatives: ['Respuesta 1', 'Respuesta 2', 'Respuesta 3', 'Respuesta 4'],
    correctAlternativeIndex: 0,
  ),
];

// Lista de preguntas para un tema específico

final List<Question> preguntasLiteratura = [
  Question(
    id: 1,
    questionText: '¿Cómo funciona...?',
    difficulty: 'Intermedio',
    alternatives: ['Respuesta 1', 'Respuesta 2', 'Respuesta 3', 'Respuesta 4'],
    correctAlternativeIndex: 0,
  ),
];

final List<Topic> balotasHistoria = [
  Topic(
    id: 'T1',
    title: 'Historia y Ciencias Auxiliares',
    subtitle: 'Balota #1',
    subCorto: 'B1',
    imageUrl: 'assets/background.jpg',
    avatarUrl: 'assets/background.png',
    description: 'Descripción del Tema 1',
    questions: hbalota1,
    courseId: 6,
  ),
  Topic(
    id: 'T2',
    title: 'Hominización',
    subtitle: 'Balota #2',
    subCorto: 'B2',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: preguntasHistoriaBalota2,
    courseId: 6,
  ),
  Topic(
    id: 'T3',
    title: 'Pre-Incas',
    subtitle: 'Balota #3',
    subCorto: 'B3',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Edad Media',
    subtitle: 'Balota #4',
    subCorto: 'B4',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Incas I',
    subtitle: 'Balota #5',
    subCorto: 'B5',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Incas II',
    subtitle: 'Balota #6',
    subCorto: 'B6',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Colonia',
    subtitle: 'Balota #7',
    subCorto: 'B7',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Ilustración',
    subtitle: 'Balota #8',
    subCorto: 'B8',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Revolución Francesa',
    subtitle: 'Balota #9',
    subCorto: 'B9',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Reveliones del siglo XVIII',
    subtitle: 'Balota #10',
    subCorto: 'B10',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Independencia',
    subtitle: 'Balota #11',
    subCorto: 'B11',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Primer Militarismo y El Guano',
    subtitle: 'Balota #12',
    subCorto: 'B12',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Guerra con Chile y Segundo Militarismo',
    subtitle: 'Balota #13',
    subCorto: 'B13',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Civilismo y Oncenio',
    subtitle: 'Balota #14',
    subCorto: 'B14',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Guerras Mundiales',
    subtitle: 'Balota #15',
    subCorto: 'B15',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Década Perdida',
    subtitle: 'Balota #16',
    subCorto: 'B16',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Fujimorato',
    subtitle: 'Balota #17',
    subCorto: 'B17',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Presidentes del Siglo XXI',
    subtitle: 'Balota #18',
    subCorto: 'B18',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: [],
    courseId: 6,
  ),
  Topic(
    id: 'T4',
    title: 'Presidentes General',
    subtitle: 'Prácticas #1',
    subCorto: 'P1',
    imageUrl: 'assets/background_2.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 2',
    questions: bpresidentesperu,
    courseId: 6,
  ),
];

final List<Topic> balotasGeografia = [
  Topic(
    id: 'T1',
    title: 'Espacio Geografico y sus Interrelaciones',
    subtitle: 'Balota #1',
    subCorto: 'B1',
    imageUrl: 'assets/background.jpg',
    avatarUrl: 'assets/avatar.png',
    description: 'Descripción del Tema 1',
    questions: geografiabalota1,
    courseId: 1,
  ),
];

// Lista de temas para un curso específico
final List<Topic> balota1Biologia = [
  Topic(
    id: 't1',
    title: 'Tema 1',
    subtitle: 'Balota #1',
    imageUrl: 'assets/background.jpg',
    description: 'Descripción del Tema 1',
    questions: preguntasBiologia,
  ),
  Topic(
    id: 't2',
    title: 'Tema 2',
    subtitle: 'Balota #2',
    imageUrl: 'assets/background.jpg',
    description: 'Descripción del Tema 2',
    questions: [],
  ),
  // ... Agregar más temas ...
];

// Lista de preguntas para un tema específico

final List<Topic> balota1Literatura = [
  Topic(
    id: 't1',
    title: 'Tema 1',
    subtitle: 'Balota #1',
    imageUrl: 'assets/background.jpg',
    description: 'Descripción del Tema 1',
    questions: preguntasLiteratura,
  ),
  Topic(
    id: 't2',
    title: 'Tema 2',
    subtitle: 'Balota #2',
    imageUrl: 'assets/background.jpg',
    description: 'Descripción del Tema 2',
    questions: [],
  ),
  // ... Agregar más temas ...
];

// Lista de cursos disponibles
final List<Course> courses = [
  Course(
    id: 1,
    title: 'Biologia',
    description: 'Descripción de la Materia 2',
    image: 'assets/biologia.png',
    topics: balota1Biologia,
  ),
  Course(
    id: 2,
    title: 'Cívica',
    description: 'Descripción de la Materia 2',
    image: 'assets/civica.png',
    topics: balota1Biologia,
  ),
  Course(
    id: 3,
    title: 'Economía',
    description: 'Descripción de la Materia 2',
    image: 'assets/economia.png',
    topics: balota1Biologia,
  ),
  Course(
    id: 4,
    title: 'Filosofía',
    description: 'Descripción de la Materia 2',
    image: 'assets/filosofia.png',
    topics: balota1Biologia,
  ),
  Course(
    id: 5,
    title: 'Física',
    description: 'Descripción de la Materia 5',
    image: 'assets/fisica.png',
    topics: [],
  ),
  Course(
    id: 6,
    title: 'Historia',
    description: 'Descripción de la Materia 1',
    image: 'assets/historia.png',
    topics: balotasHistoria,
  ),
  Course(
    id: 7,
    title: 'Inglés',
    description: 'Descripción de la Geografía',
    image: 'assets/ingles.png',
    topics: balotasGeografia,
  ),
  Course(
    id: 8,
    title: 'Lenguaje',
    description: 'Descripción de la Literatura',
    image: 'assets/lenguaje.png',
    topics: balota1Literatura,
  ),
  Course(
    id: 9,
    title: 'Literatura',
    description: 'Descripción de la Materia 4',
    image: 'assets/literatura.png',
    topics: [],
  ),
  Course(
    id: 10,
    title: 'Psicología',
    description: 'Descripción de la Materia 4',
    image: 'assets/psicologia.png',
    topics: [],
  ),
  Course(
    id: 11,
    title: 'Matemática',
    description: 'Descripción de la Materia 4',
    image: 'assets/matematica.png',
    topics: [],
  ),
  Course(
    id: 12,
    title: 'Química',
    description: 'Descripción de la Materia 6',
    image: 'assets/quimica.png',
    topics: [],
  ),
  Course(
    id: 13,
    title: 'Raz. Verbal',
    description: 'Descripción de la Materia 6',
    image: 'assets/rv.png',
    topics: [],
  ),
  Course(
    id: 14,
    title: 'Raz. Matemático',
    description: 'Descripción de la Materia 6',
    image: 'assets/rm.png',
    topics: [],
  ),
];

final List<Topic> popularTopics = [
  balotasHistoria[0],
  balotasHistoria[1],
  balotasHistoria[18],
  balotasGeografia[0],
];
