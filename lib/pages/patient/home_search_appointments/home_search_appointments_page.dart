import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/pages/patient/schedule_appointment/schedule_appointment_page.dart';
import 'package:terapi_frontend/pages/patient/search_appointment_filters/search_appointment_filters_page.dart';
import 'package:terapi_frontend/pages/patient/search_appointment_therapist/search_appointment_therapist_page.dart';
import 'package:terapi_frontend/pages/patient/therapist_profile_opinions/therapist_profile_opinions_page.dart';
import 'package:terapi_frontend/pages/patient/appointment_schedules_selection/appointment_schedules_selection_page.dart';

import 'home_search_appointments_controller.dart';

class PatientHomeSearchAppointmentsPage extends StatelessWidget {

  const PatientHomeSearchAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientHomeSearchAppointmentsController());

    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.filter_alt_outlined, color: Colors.green),
            title: const Text("Agregar Filtros"),
            subtitle: const Text("Especialidad, idioma, precio..."),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const PatientSearchAppointmentFiltersPage());
            },
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar terapeuta...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),

          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.terapeutas.length,
              itemBuilder: (context, index) {
                final t = controller.terapeutas[index];

                return Card(

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 1,

                  child: Padding(

                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // || FILA SUPERIOR: AVATAR, NOMBRE Y BOTÓN DE OPINIONES ||
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(t.imagen),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(t.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text('Cédula ${t.cedula}'),
                                ],
                              ),
                            ),

                            TextButton(

                              onPressed: () {
                                Get.to(() => const PatientTherapistProfileOpinionsPage());
                              },

                              child: const Text(
                                "Ver opiniones (15)",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 10),

                        // Información detallada del terapeuta
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• Idiomas: ${t.idiomas.join(', ')}"),
                              Text("• Nacionalidad: ${t.nacionalidad}"),
                              Text("• Enfoque: ${t.enfoque}"),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Etiquetas de especialidades
                        Wrap(
                          spacing: 6,
                          children: t.etiquetas.map((e) => Chip(
                            label: Text(e),
                            backgroundColor: Colors.grey.shade200,
                          )).toList(),
                        ),

                        const SizedBox(height: 12),

                        // BOTONES: VER PERFIL Y AGENDAR CITA
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            OutlinedButton(onPressed: () {
                              Get.to(() => const PatientSearchAppointmentTherapistPage()); // Para futura update: Get.to(() => SearchAppointmentTherapistPage(terapeuta: t));
                            }, child: Text("Ver perfil")),

                            const SizedBox(width: 8),

                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => const PatientScheduleAppointmentPage()); // Para futura update: Get.to(() => ScheduleAppointmentPage(terapeuta: t));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                              ),
                              child: Text("Agendar cita"),
                            ),

                          ],
                        ) // Row

                      ], // children
                    ),  // child: Column
                  ),  // child: Padding
                );  // return Card
              },  // itemBuilder: (context, index)
            )), // child: Obx
          ),  // Expanded
        ],  // children
      ),  // body: Column
    ); // return Scaffold
  } // Widget build(BuildContext context)
} // class HomeSearchAppointmentsPage extends StatelessWidget
