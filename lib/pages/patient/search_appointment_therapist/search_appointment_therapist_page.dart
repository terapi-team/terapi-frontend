// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Navegaciones
import 'package:terapi_frontend/pages/patient/therapist_profile_opinions/therapist_profile_opinions_page.dart';
import 'package:terapi_frontend/pages/patient/schedule_appointment/schedule_appointment_page.dart';

// IMPORTACIÓN: Controlador
import 'search_appointment_therapist_controller.dart';

// CLASE: Página de perfil del terapeuta seleccionado
class PatientSearchAppointmentTherapistPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientSearchAppointmentTherapistPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientSearchAppointmentTherapistController());
    final t = controller.terapeuta;

    return Scaffold(

      // APPBAR
      appBar: SettingsAppBar(title: ""),

      // BODY: Contenido desplazable
      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // SECCIÓN: Imagen principal del terapeuta
            ClipRRect(

              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),

              child: Image.asset(
                t.imagen,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),

            ), // ClipRRect(

            // SECCIÓN: Detalle general
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // FILA: Nombre, enfoque, calificación y acciones
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // AVATAR
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(t.imagen),
                      ),

                      const SizedBox(width: 12),

                      // INFORMACIÓN: Nombre, enfoque y calificación
                      Expanded(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(t.nombre, style: Theme.of(context).textTheme.titleMedium),
                            Text(t.enfoque),

                            // BOTÓN: Ver opiniones
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const PatientTherapistProfileOpinionsPage());
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const SizedBox(width: 4),

                                  // TEXTO: Rating
                                  Text(
                                    "${t.rating}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.orange,
                                    ),

                                  ),
                                ], // children: [
                              ), // child: Row(
                            ), // GestureDetector(
                          ], // children: [
                        ), // child: Column(
                      ), // Expanded(

                      // ACCIONES: Favorito y compartir
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.favorite_border),
                          SizedBox(width: 8),
                          Icon(Icons.share),
                        ],
                      )

                    ],
                  ),

                  const SizedBox(height: 12),

                  // ETIQUETAS: País, experiencia, idiomas
                  Wrap(
                    spacing: 8,
                    children: [
                      _infoChip(t.pais),
                      _infoChip(t.experiencia),
                      _infoChip(t.idiomas.join(", ")),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // BOTONES: Agendar cita y consulta virtual
                  Row(
                    children: [

                      // BOTÓN: Agendar cita
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.to(() => const PatientScheduleAppointmentPage()); // NAVEGACIÓN
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text("Agendar cita"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // BOTÓN: Consulta virtual
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.video_call_outlined),
                          label: const Text("Consulta virtual"),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 20),

                  // SECCIÓN: Sobre mí
                  const Text("Sobre Mí", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(t.sobreMi),

                  const SizedBox(height: 16),

                  // SECCIÓN: Especialidades
                  const Text("Áreas de especialización", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: t.especialidades.map((e) => Chip(label: Text(e))).toList(),
                  ),

                  const SizedBox(height: 16),

                  // SECCIÓN: Formación académica
                  const Text("Formación académica", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  ...t.formaciones.map((f) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(f.grado),
                      Text(f.institucion, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                    ],
                  )),

                ], // children: [
              ), // child: Column(
            ), // Padding(
          ], // children: [
        ), // child: Column(
      ), // body: SingleChildScrollView(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {

  // WIDGET: Chip decorativo de información
  Widget _infoChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.orange.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  } // Widget _infoChip(String label) {

} // class PatientSearchAppointmentTherapistPage extends StatelessWidget {
