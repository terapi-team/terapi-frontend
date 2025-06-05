// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de cita
class Appointment {

  // ATRIBUTOS
  final String nombre;       // ATRIBUTO: Nombre del terapeuta
  final String especialidad; // ATRIBUTO: Especialidad del terapeuta
  final String fecha;        // ATRIBUTO: Fecha de la cita
  final String hora;         // ATRIBUTO: Hora de la cita
  final String modalidad;    // ATRIBUTO: Modalidad: Virtual o Presencial
  final String imagen;       // ATRIBUTO: Ruta de imagen del terapeuta

  // CONSTRUCTOR
  Appointment({
    required this.nombre,
    required this.especialidad,
    required this.fecha,
    required this.hora,
    required this.modalidad,
    required this.imagen,
  });

} // class Appointment {

// CLASE: Controlador para gestionar citas del paciente
class PatientAppointmentsController extends GetxController {

  // ATRIBUTO: Lista de próximas citas (Observable)
  var proximas = <Appointment>[].obs;

  // ATRIBUTO: Lista de citas pasadas o historial (Observable)
  var historial = <Appointment>[].obs;

  // MÉTODO: onInit — Se ejecuta al inicializar el controlador
  @override
  void onInit() {
    super.onInit();
    cargarCitas();
  }

  // MÉTODO: Cargar citas simuladas (proximas e historial)
  void cargarCitas() {

    // SIMULACIÓN: Próximas citas
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

    // SIMULACIÓN: Historial
    historial.value = [];

  } // void cargarCitas() {

  // MÉTODO: Agregar una nueva cita a la lista de próximas
  void agregarCita(Appointment nuevaCita) {
    proximas.insert(0, nuevaCita);
  }

} // class PatientAppointmentsController extends GetxController {
