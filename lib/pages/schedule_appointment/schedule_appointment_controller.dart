import 'package:get/get.dart';

class ServiceOption {

  final String titulo;
  final String subtitulo;
  final String duracion;
  final String precio;
  final String icono;

  ServiceOption({

    required this.titulo,
    required this.subtitulo,
    required this.duracion,
    required this.precio,
    required this.icono,

  });

} // ServiceOption

class ScheduleAppointmentController extends GetxController {
  var servicios = <ServiceOption>[].obs;

  @override
  void onInit() {
    super.onInit();
    cargarServicios();
  }

  void cargarServicios() {

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
  } // void cargarServicios
} // class ScheduleAppointmentController extends GetxController {
