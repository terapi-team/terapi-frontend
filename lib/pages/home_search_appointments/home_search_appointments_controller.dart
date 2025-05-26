import 'package:get/get.dart';

class Therapist {

  final String nombre;
  final String cedula;
  final List<String> idiomas;
  final String nacionalidad;
  final String enfoque;
  final List<String> etiquetas;
  final String imagen;

  Therapist({

    required this.nombre,
    required this.cedula,
    required this.idiomas,
    required this.nacionalidad,
    required this.enfoque,
    required this.etiquetas,
    required this.imagen,

  }); // Therapist

} // class Therapist

class HomeSearchAppointmentsController extends GetxController {

  var terapeutas = <Therapist>[].obs;

  @override
  void onInit() {
    super.onInit();
    cargarTerapeutas();
  }

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

      ),  // Therapist

      Therapist(

        nombre: "Dr. Carlos Rodríguez",
        cedula: "849206",
        idiomas: ["Español"],
        nacionalidad: "Peruana",
        enfoque: "Psicología Clínica",
        etiquetas: ["Terapia de Pareja", "Autoestima", "Relaciones"],
        imagen: "assets/images/therapists/carlos.jpg",

      ),  // Therapist

    ]; // lista

    terapeutas.value = lista;

  } // void cargarTerapeutas

} // class HomeSearchAppointmentsController
