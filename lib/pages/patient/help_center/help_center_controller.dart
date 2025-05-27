import 'package:get/get.dart';

class PatientHelpQuestion {

  final String title;
  final String category;

  PatientHelpQuestion({required this.title, required this.category});

}

class PatientHelpCenterController extends GetxController {

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

  List<String> get categories =>
      questions.map((q) => q.category).toSet().toList();

}
