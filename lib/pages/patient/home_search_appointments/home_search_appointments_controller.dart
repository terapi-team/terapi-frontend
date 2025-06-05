// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de terapeuta
class Therapist {

  // ATRIBUTOS
  final String nombre;           // ATRIBUTO: Nombre completo del terapeuta
  final String cedula;           // ATRIBUTO: Número de cédula profesional
  final List<String> idiomas;    // ATRIBUTO: Idiomas que habla
  final String nacionalidad;     // ATRIBUTO: Nacionalidad del terapeuta
  final String enfoque;          // ATRIBUTO: Enfoque terapéutico
  final List<String> etiquetas;  // ATRIBUTO: Temas que trata (tags)
  final String imagen;           // ATRIBUTO: Ruta de imagen del terapeuta

  // CONSTRUCTOR
  Therapist({

    required this.nombre,
    required this.cedula,
    required this.idiomas,
    required this.nacionalidad,
    required this.enfoque,
    required this.etiquetas,
    required this.imagen,

  }); // Therapist({

} // class Therapist {

// CLASE: Controlador para búsqueda de terapeutas
class PatientHomeSearchAppointmentsController extends GetxController {

  // ATRIBUTO: Lista observable de terapeutas disponibles
  var terapeutas = <Therapist>[].obs;

  // MÉTODO: Se ejecuta al iniciar el controlador
  @override
  void onInit() {
    super.onInit();
    cargarTerapeutas();
  }

  // MÉTODO: Cargar lista simulada de terapeutas
  void cargarTerapeutas() {

    final lista = [

      Therapist(
        nombre: "Dra. María García",
        cedula: "970897",
        idiomas: ["Español", "Inglés"],
        nacionalidad: "Peruana",
        enfoque: "Terapia Cognitivo-Conductual",
        etiquetas: ["Ansiedad", "Depresión", "Estrés"],
        imagen: "assets/images/therapists/maria.jpg",
      ),

      Therapist(
        nombre: "Dr. Carlos Rodríguez",
        cedula: "849206",
        idiomas: ["Español"],
        nacionalidad: "Peruana",
        enfoque: "Psicología Clínica",
        etiquetas: ["Terapia de Pareja", "Autoestima", "Relaciones"],
        imagen: "assets/images/therapists/carlos.jpg",
      ),

    ]; // lista

    // ACTUALIZACIÓN: Asigna la lista a la variable observable
    terapeutas.value = lista;

  } // void cargarTerapeutas

} // class PatientHomeSearchAppointmentsController extends GetxController {
