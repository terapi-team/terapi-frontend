import 'package:get/get.dart';

class TherapistDetail {

  final String nombre;
  final String enfoque;
  final double rating;
  final String pais;
  final String experiencia;
  final List<String> idiomas;
  final List<String> especialidades;
  final String sobreMi;
  final List<Formacion> formaciones;
  final String imagen;

  TherapistDetail({

    required this.nombre,
    required this.enfoque,
    required this.rating,
    required this.pais,
    required this.experiencia,
    required this.idiomas,
    required this.especialidades,
    required this.sobreMi,
    required this.formaciones,
    required this.imagen,

  }); // TherapistDetail

} // class TherapistDetail {

class Formacion {

  final String grado;
  final String institucion;

  Formacion({required this.grado, required this.institucion});

} // class Formacion {

class PatientSearchAppointmentTherapistController extends GetxController {

  late TherapistDetail terapeuta;

  @override
  void onInit() {
    super.onInit();
    cargarDatos();
  }

  void cargarDatos() {

    terapeuta = TherapistDetail(

      nombre: "Dra. María Garcia",
      enfoque: "Terapia Cognitivo-Conductual",
      rating: 4.8,
      pais: "México",
      experiencia: "8 años",
      idiomas: ["Español", "Inglés"],
      especialidades: ["Ansiedad", "Depresión", "Estrés"],
      sobreMi: "Soy una persona honesta, empática, prudente y muy proactiva.",

      formaciones: [

        Formacion(
          grado: "Maestría en psicoterapia cognitivo conductual",
          institucion: "Centro de Psicoterapia Cognitiva",
        ),

        Formacion(
          grado: "Licenciatura en Psicología",
          institucion: "Universidad Autónoma de Guadalajara",
        ),

      ],

      imagen: "assets/images/therapists/maria.jpg",

    ); // terapeuta = TherapistDetail(
  } // void cargarDatos() {
} // class SearchAppointmentTherapistController extends GetxController {
