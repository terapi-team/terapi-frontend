// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de detalle del terapeuta
class TherapistDetail {

  // ATRIBUTOS
  final String nombre;                    // ATRIBUTO: Nombre del terapeuta
  final String enfoque;                   // ATRIBUTO: Enfoque terapéutico
  final double rating;                    // ATRIBUTO: Calificación promedio
  final String pais;                      // ATRIBUTO: País de origen
  final String experiencia;               // ATRIBUTO: Años de experiencia
  final List<String> idiomas;             // ATRIBUTO: Idiomas que habla
  final List<String> especialidades;      // ATRIBUTO: Especialidades que trata
  final String sobreMi;                   // ATRIBUTO: Descripción personal
  final List<Formacion> formaciones;      // ATRIBUTO: Lista de formaciones académicas
  final String imagen;                    // ATRIBUTO: Ruta de imagen

  // CONSTRUCTOR
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
  });

} // class TherapistDetail {

// CLASE: Modelo de formación académica
class Formacion {

  // ATRIBUTOS
  final String grado;           // ATRIBUTO: Nombre del grado o título
  final String institucion;     // ATRIBUTO: Institución que lo otorgó

  // CONSTRUCTOR
  Formacion({required this.grado, required this.institucion});

} // class Formacion {

// CLASE: Controlador para perfil de terapeuta (detalle)
class PatientSearchAppointmentTherapistController extends GetxController {

  // ATRIBUTO: Información detallada del terapeuta
  late TherapistDetail terapeuta;

  // MÉTODO: onInit
  @override
  void onInit() {
    super.onInit();
    cargarDatos();
  }

  // MÉTODO: Cargar datos simulados del terapeuta
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
} // class PatientSearchAppointmentTherapistController extends GetxController {
