// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE
class PatientTermsAndConditionsController extends GetxController {

  // ATRIBUTO: Título principal de la sección
  final termsTitle = 'Términos y Condiciones de Uso';

  // ATRIBUTO: Introducción general del documento
  final termsIntro =
      'Bienvenido a nuestra plataforma de terapia en línea. Al acceder y utilizar este servicio, aceptas cumplir con los siguientes términos y condiciones.';

  // ATRIBUTO: Secciones detalladas de los términos
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
  ]; // final sections = [
} // class PatientTermsAndConditionsController extends GetxController {
