// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de pregunta frecuente del centro de ayuda
class PatientHelpQuestion {

  // ATRIBUTOS
  final String title; // ATRIBUTO: Título de la pregunta
  final String category; // ATRIBUTO: Categoría

  // CONSTRUCTOR
  PatientHelpQuestion({required this.title, required this.category});

}

// CLASE
class PatientHelpCenterController extends GetxController {

  // ATRIBUTO: Lista observable de preguntas frecuentes agrupadas por categoría
  final questions = <PatientHelpQuestion>[

    PatientHelpQuestion(title: '¿Cómo agendar una cita?', category: 'Citas y Agenda'),
    PatientHelpQuestion(title: '¿Cómo cancelar una cita?', category: 'Citas y Agenda'),
    PatientHelpQuestion(title: '¿Qué pasa si llego tarde?', category: 'Citas y Agenda'),
    PatientHelpQuestion(title: '¿Qué métodos de pago aceptan?', category: 'Pagos y Facturación'),
    PatientHelpQuestion(title: '¿Cómo solicitar una factura?', category: 'Pagos y Facturación'),
    PatientHelpQuestion(title: '¿Cuál es la política de reembolso?', category: 'Pagos y Facturación'),
    PatientHelpQuestion(title: '¿Cómo cambiar mi contraseña?', category: 'Cuenta y Privacidad'),
    PatientHelpQuestion(title: '¿Cómo actualizar mis datos?', category: 'Cuenta y Privacidad'),
    PatientHelpQuestion(title: '¿Es segura mi información?', category: 'Cuenta y Privacidad'),

  ].obs;

  // GETTER: Lista de categorías únicas extraídas de las preguntas
  List<String> get categories =>
      questions.map((q) => q.category).toSet().toList();

} // class PatientHelpCenterController extends GetxController {
