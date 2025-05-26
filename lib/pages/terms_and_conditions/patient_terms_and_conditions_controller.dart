import 'package:get/get.dart';

class PatientTermsAndConditionsController extends GetxController {

  final termsTitle = 'Términos y Condiciones de Uso';

  final termsIntro =
      'Bienvenido a nuestra plataforma de terapia en línea. Al acceder y utilizar este servicio, aceptas cumplir con los siguientes términos y condiciones.';

  final sections = [
    {
      'title': '1. Servicios',
      'content':
          'Proporcionamos una plataforma que conecta a pacientes con profesionales de la salud mental calificados. Todos nuestros terapeutas están debidamente certificados y verificados.',
    },
    {
      'title': '2. Privacidad',
      'content':
          'Protegemos tu privacidad y la confidencialidad de tus sesiones. Toda la información compartida está protegida bajo estrictos protocolos de seguridad.',
    },
    {
      'title': '3. Pagos',
      'content':
          'Los pagos se procesan de manera segura. Las tarifas se cobran por adelantado y pueden variar según el tipo de servicio y el profesional seleccionado.',
    },
    {
      'title': '4. Cancelaciones',
      'content':
          'Las cancelaciones deben realizarse con al menos 24 horas de anticipación para recibir un reembolso completo.',
    },
  ];  // sections

} // class
