// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Controlador para filtros de búsqueda de cita
class PatientSearchAppointmentFiltersController extends GetxController {

  // ATRIBUTOS  
  var motivoSeleccionado = ''.obs; // ATRIBUTO: Motivo seleccionado (Observable)
  var nombrePsicologo = ''.obs;  // ATRIBUTO: Nombre del psicólogo buscado (Observable)
  var paisSeleccionado = ''.obs;  // ATRIBUTO: País seleccionado (Observable)
  var generoSeleccionado = ''.obs;  // ATRIBUTO: Género del terapeuta seleccionado (Observable)

  // LISTA: Motivos disponibles para filtrar
  final motivos = [
    "Ansiedad",
    "Depresión",
    "Estrés",
    "Autoestima",
    "Relaciones"
  ];

  // LISTA: Países disponibles para filtrar
  final paises = [
    "México",
    "Argentina",
    "Perú",
    "Colombia",
    "Chile"
  ];

  // LISTA: Géneros disponibles para filtrar
  final generos = [
    "Hombre",
    "Mujer"
  ];

  // MÉTODO: Aplicar los filtros seleccionados (simulación)
  void aplicarFiltro() {
    print("Motivo: $motivoSeleccionado");
    print("Nombre: $nombrePsicologo");
    print("País: $paisSeleccionado");
    print("Género: $generoSeleccionado");
  }

} // class PatientSearchAppointmentFiltersController extends GetxController {
