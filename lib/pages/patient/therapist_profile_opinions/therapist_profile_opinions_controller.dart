// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de opinión de paciente
class Opinion {

  // ATRIBUTOS
  final String nombre;      // ATRIBUTO: Nombre del paciente que opina
  final String fecha;       // ATRIBUTO: Fecha de publicación
  final int estrellas;      // ATRIBUTO: Valoración en estrellas (1 a 5)
  final String comentario;  // ATRIBUTO: Texto del comentario

  // CONSTRUCTOR
  Opinion({
    required this.nombre,
    required this.fecha,
    required this.estrellas,
    required this.comentario,
  });

} // class Opinion {

// CLASE: Controlador para opiniones del perfil del terapeuta
class PatientTherapistProfileOpinionsController extends GetxController {

  // ATRIBUTOS
  var opiniones = <Opinion>[].obs;  // ATRIBUTO: Lista de opiniones (Observable)
  var valoracion = 0.obs;           // ATRIBUTO: Valoración seleccionada para nueva opinión
  var comentario = ''.obs;          // ATRIBUTO: Comentario escrito por el paciente

  // MÉTODO: Se ejecuta al iniciar el controlador
  @override
  void onInit() {
    super.onInit();
    cargarOpiniones();
  }

  // MÉTODO: Cargar lista simulada de opiniones
  void cargarOpiniones() {

    opiniones.value = [

      Opinion(
        nombre: "María González",
        fecha: "15 Mar 2024",
        estrellas: 5,
        comentario:
            "Excelente profesional. Me ayudó muchísimo con mi ansiedad. Sus técnicas son muy efectivas y tiene una forma muy empática de tratar los problemas.",
      ),

      Opinion(
        nombre: "Carlos Ruiz",
        fecha: "10 Mar 2024",
        estrellas: 4,
        comentario:
            "Muy buena experiencia. Las sesiones son muy productivas y se nota su experiencia en el campo.",
      ),

    ]; // opiniones.value = [
  } // void cargarOpiniones() {

  // MÉTODO: Publicar una nueva opinión (si es válida)
  void publicarComentario() {
    if (valoracion.value > 0 && comentario.value.isNotEmpty) {

      opiniones.insert(

        0, // INSERCIÓN: AL INICIO

        Opinion(
          nombre: "Usuario Anónimo",
          fecha: "Hoy",
          estrellas: valoracion.value,
          comentario: comentario.value,
        ),

      );

      // REINICIO: Limpia campos tras publicar
      valoracion.value = 0;
      comentario.value = '';

    } // if (valoracion.value > 0 && comentario.value.isNotEmpty) {
  } // void publicarComentario() {
} // class PatientTherapistProfileOpinionsController extends GetxController {
