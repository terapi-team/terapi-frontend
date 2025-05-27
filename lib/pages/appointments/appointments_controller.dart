import 'package:get/get.dart';

class Appointment {

  final String nombre;
  final String especialidad;
  final String fecha;
  final String hora;
  final String modalidad;
  final String imagen;

  Appointment({
    required this.nombre,
    required this.especialidad,
    required this.fecha,
    required this.hora,
    required this.modalidad,
    required this.imagen,
  });

} // class Appointment {

class AppointmentsController extends GetxController {

  var proximas = <Appointment>[].obs;
  var historial = <Appointment>[].obs;

  @override
  void onInit() {
    super.onInit();
    cargarCitas();
  }

  void cargarCitas() {

    proximas.value = [

      Appointment(
        nombre: "Dra. María García",
        especialidad: "Terapia Cognitivo-Conductual",
        fecha: "martes, 19 de marzo",
        hora: "15:30 hrs",
        modalidad: "Virtual",
        imagen: "assets/images/therapists/maria.jpg",
      ),

      Appointment(
        nombre: "Dr. Carlos Rodríguez",
        especialidad: "Psicología Clínica",
        fecha: "domingo, 24 de marzo",
        hora: "10:00 hrs",
        modalidad: "Presencial",
        imagen: "assets/images/therapists/carlos.jpg",
      ),

    ]; // proximas.value = [

    historial.value = []; // Simulación

  } // void cargarCitas() {

  void agregarCita(Appointment nuevaCita) {
    proximas.insert(0, nuevaCita);
  }

} // class AppointmentsController extends GetxController {
