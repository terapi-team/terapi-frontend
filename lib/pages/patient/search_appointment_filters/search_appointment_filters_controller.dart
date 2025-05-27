import 'package:get/get.dart';

class PatientSearchAppointmentFiltersController extends GetxController {

  var motivoSeleccionado = ''.obs;
  var nombrePsicologo = ''.obs;
  var paisSeleccionado = ''.obs;
  var generoSeleccionado = ''.obs;

  final motivos = [
    "Ansiedad",
    "Depresión",
    "Estrés",
    "Autoestima",
    "Relaciones"
  ];

  final paises = [
    "México",
    "Argentina",
    "Perú",
    "Colombia",
    "Chile"
  ];

  final generos = [
    "Hombre",
    "Mujer"
  ];

  void aplicarFiltro() {
    print("Motivo: $motivoSeleccionado");
    print("Nombre: $nombrePsicologo");
    print("País: $paisSeleccionado");
    print("Género: $generoSeleccionado");
  }

} // class PatientSearchAppointmentFiltersController extends GetxController {
