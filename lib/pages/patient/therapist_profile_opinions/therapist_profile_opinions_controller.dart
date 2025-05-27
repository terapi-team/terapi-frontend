
import 'package:get/get.dart';

class Opinion {

  final String nombre;
  final String fecha;
  final int estrellas;
  final String comentario;

  Opinion({
    required this.nombre,
    required this.fecha,
    required this.estrellas,
    required this.comentario,
  });

} // 

class PatientTherapistProfileOpinionsController extends GetxController {

  var opiniones = <Opinion>[].obs;
  var valoracion = 0.obs;
  var comentario = ''.obs;

  @override
  void onInit() {
    super.onInit();
    cargarOpiniones();
  }

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

    ];
  }

  void publicarComentario() {
    if (valoracion.value > 0 && comentario.value.isNotEmpty) {

      opiniones.insert(

        0,

        Opinion(
          nombre: "Usuario Anónimo",
          fecha: "Hoy",
          estrellas: valoracion.value,
          comentario: comentario.value,
        ),

      );

      valoracion.value = 0;
      comentario.value = '';

    } // if (valoracion.value > 0 && comentario.value.isNotEmpty) {
  } // void publicarComentario() {
} // class TherapistProfileOpinionsController extends GetxController {
