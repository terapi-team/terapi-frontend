// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de servicio de cita
class ServiceOption {

  // ATRIBUTOS
  final String titulo;     // ATRIBUTO: Título del servicio (ej. "Cita individual")
  final String subtitulo;  // ATRIBUTO: Descripción breve del servicio
  final String duracion;   // ATRIBUTO: Duración de la sesión
  final String precio;     // ATRIBUTO: Precio del servicio
  final String icono;      // ATRIBUTO: Ruta al ícono ilustrativo

  // CONSTRUCTOR
  ServiceOption({
    required this.titulo,
    required this.subtitulo,
    required this.duracion,
    required this.precio,
    required this.icono,
  });

} // class ServiceOption {

// CLASE: Controlador para mostrar lista de servicios disponibles
class PatientScheduleAppointmentController extends GetxController {

  // ATRIBUTO: Lista observable de servicios disponibles
  var servicios = <ServiceOption>[].obs;

  // MÉTODO: Se ejecuta al iniciar el controlador
  @override
  void onInit() {
    super.onInit();
    cargarServicios();
  }

  // MÉTODO: Cargar lista simulada de servicios
  void cargarServicios() {

    // LISTA: Opciones de servicios
    servicios.value = [

      ServiceOption(
        titulo: "Cita individual",
        subtitulo: "Sesión uno a uno con el psicólogo",
        duracion: "50 min",
        precio: "S/ 140.00 PEN",
        icono: "assets/icons/user-single.svg",
      ),

      ServiceOption(
        titulo: "Cita individual doble",
        subtitulo: "Sesión extendida uno a uno",
        duracion: "100 min",
        precio: "S/ 280.00 PEN",
        icono: "assets/icons/user-single.svg",
      ),

      ServiceOption(
        titulo: "Cita de pareja",
        subtitulo: "Terapia para parejas",
        duracion: "50 min",
        precio: "S/ 180.00 PEN",
        icono: "assets/icons/users-pair.svg",
      ),

      ServiceOption(
        titulo: "Cita de pareja doble",
        subtitulo: "Terapia extendida para parejas",
        duracion: "100 min",
        precio: "S/ 360.00 PEN",
        icono: "assets/icons/users-pair.svg",
      ),

    ]; // servicios.value = [
  } // void cargarServicios() {
} // class PatientScheduleAppointmentController extends GetxController {
