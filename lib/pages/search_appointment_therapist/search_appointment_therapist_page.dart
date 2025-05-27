import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'package:terapi_frontend/pages/therapist_profile_opinions/therapist_profile_opinions_page.dart';
import 'package:terapi_frontend/pages/schedule_appointment/patient_schedule_appointment_page.dart';

import 'search_appointment_therapist_controller.dart';

class SearchAppointmentTherapistPage extends StatelessWidget {

  const SearchAppointmentTherapistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SearchAppointmentTherapistController());
    final t = controller.terapeuta;

    return Scaffold(

      appBar: SettingsAppBar(title: ""),
      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // || IMAGEN PRINCIPAL ||
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

            Padding(

              padding: const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // || INFORMACIÓN PRINCIPAL ||
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(t.imagen),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(t.nombre, style: Theme.of(context).textTheme.titleMedium),
                            Text(t.enfoque),

                            GestureDetector(
                              onTap: () {
                                Get.to(() => const TherapistProfileOpinionsPage());
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${t.rating}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

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

                  // || ETIQUETAS DE INFO GENERAL ||
                  Wrap(
                    spacing: 8,
                    children: [
                      _infoChip(t.pais),
                      _infoChip(t.experiencia),
                      _infoChip(t.idiomas.join(", ")),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // || BOTONES ||
                  Row(
                    children: [

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.to(() => const ScheduleAppointmentPage()); // Para futura update: pasar terapeuta, para que se visualice la data respectiva
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

                  const Text("Sobre Mí", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(t.sobreMi),

                  const SizedBox(height: 16),
                  const Text("Áreas de especialización", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  Wrap(
                    spacing: 6,
                    children: t.especialidades.map((e) => Chip(label: Text(e))).toList(),
                  ),

                  const SizedBox(height: 16),
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

  Widget _infoChip(String label) {

    return Chip(

      label: Text(label),
      backgroundColor: Colors.orange.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

    );

  } // Widget _infoChip(String label) {

} // class SearchAppointmentTherapistPage extends StatelessWidget {
