import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terapi_frontend/components/app_navigation.dart';
import 'package:terapi_frontend/pages/patient/appointments/appointments_controller.dart';

class PatientAppointmentDetailsController extends GetxController {

  final terapeutaNombre = "Dra. María García";
  final especialidad = "Psicología Clínica";
  final fecha = "26 Enero, 2024";
  final hora = "15:00";
  final duracion = "50 minutos";
  final tipoCita = "Cita individual";
  final modalidad = "Consulta virtual";
  final total = "S/ 140.00 PEN";

  var tarjeta = "Visa terminada en 4242".obs; // VALOR: "${metodo.brand} terminada en ${metodo.last4}"

  void confirmarPago() {

    print("Pago confirmado");

    // CONDICIONAL: Cierra un posible snackbar abierto
    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();

    // ÍCONO: SVG - CIRCLE CHECK
    final successIcon = SvgPicture.asset(
      'assets/icons/circle-check.svg',
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(Color(0xFF2E7D32), BlendMode.srcIn),
    );

    // VARIABLE: Tipo - Clase `Appointment`
    final nuevaCita = Appointment(
      nombre: terapeutaNombre,
      especialidad: especialidad,
      fecha: fecha,
      hora: hora,
      modalidad: modalidad,
      imagen: 'assets/images/therapists/maria.jpg',
    );

    // VARIABLE: Tipo - Clase `PatientAppointmentsController`
    final citasController = Get.find<PatientAppointmentsController>();
    citasController.agregarCita(nuevaCita);

    // SNACKBAR: Mensaje de confirmación
    Get.snackbar(
      "¡Listo!",
      "Tu cita ha sido agendada exitosamente.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade50,
      colorText: Colors.black87,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      icon: successIcon,
    );

    // DELAY: 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const AppNavigation(initialIndex: 1)); // NAVEGACIÓN: `PatientAppointmentsPage`
    });

  } // void confirmarPago() {

  void cancelar() {
    print("Cita cancelada");
  }

  void actualizarTarjeta(dynamic metodo) {

    // CONDICIONAL: Si cumple lo necesario
    if (metodo != null && metodo.brand != null && metodo.last4 != null) {

      tarjeta.value = "${metodo.brand} terminada en ${metodo.last4}";
      print("Tarjeta actualizada a: ${tarjeta.value}");

    }
  } // void actualizarTarjeta(dynamic metodo) {

} // class AppointmentDetailsController
