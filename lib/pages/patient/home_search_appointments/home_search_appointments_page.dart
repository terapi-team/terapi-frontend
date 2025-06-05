// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Páginas relacionadas
import 'package:terapi_frontend/pages/patient/schedule_appointment/schedule_appointment_page.dart';
import 'package:terapi_frontend/pages/patient/search_appointment_filters/search_appointment_filters_page.dart';
import 'package:terapi_frontend/pages/patient/search_appointment_therapist/search_appointment_therapist_page.dart';
import 'package:terapi_frontend/pages/patient/therapist_profile_opinions/therapist_profile_opinions_page.dart';
import 'package:terapi_frontend/pages/patient/appointment_schedules_selection/appointment_schedules_selection_page.dart';

// IMPORTACIÓN: Controlador
import 'home_search_appointments_controller.dart';

// CLASE
class PatientHomeSearchAppointmentsPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientHomeSearchAppointmentsPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientHomeSearchAppointmentsController());

    return Scaffold(

      // BODY: Estructura general
      body: Column(
        children: [

          const SizedBox(height: 10),

          // LIST TILE: Acceso a filtros
          ListTile(
            leading: const Icon(Icons.filter_alt_outlined, color: Colors.green),
            title: const Text("Agregar Filtros"),
            subtitle: const Text("Especialidad, idioma, precio..."),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const PatientSearchAppointmentFiltersPage());
            },
          ),

          // BUSCADOR: Campo de texto para búsqueda libre
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

          // LISTADO: Tarjetas de terapeutas (reactivo)
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.terapeutas.length,
              itemBuilder: (context, index) {
                final t = controller.terapeutas[index];

                return Card(

                  // DISEÑO: Tarjeta redondeada
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 1,

                  child: Padding(

                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // FILA: Avatar, nombre, cédula, botón de opiniones
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // AVATAR
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(t.imagen),
                            ),

                            const SizedBox(width: 12),

                            // COLUMNA: Nombre y cédula
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(t.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text('Cédula ${t.cedula}'),
                                ],
                              ),
                            ),

                            // BOTÓN: Opiniones
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

                        // INFORMACIÓN: Idiomas, nacionalidad y enfoque
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

                        // ETIQUETAS: Chips de especialidades
                        Wrap(
                          spacing: 6,
                          children: t.etiquetas.map((e) => Chip(
                            label: Text(e),
                            backgroundColor: Colors.grey.shade200,
                          )).toList(),
                        ),

                        const SizedBox(height: 12),

                        // ACCIONES: Ver perfil / Agendar cita
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            // BOTÓN: Ver perfil
                            OutlinedButton(onPressed: () {
                              Get.to(() => const PatientSearchAppointmentTherapistPage()); // NAVEGACIÓN
                            }, child: Text("Ver perfil")),

                            const SizedBox(width: 8),

                            // BOTÓN: Agendar cita
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => const PatientScheduleAppointmentPage()); // NAVEGACIÓN
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                              ),
                              child: Text("Agendar cita"),
                            ),

                          ],
                        ) // Row(

                      ], // children: [
                    ),  // child: Column(
                  ),  // child: Padding(
                );  // return Card(
              },  // itemBuilder: (context, index) {
            )), // child: Obx(() => ListView.builder(
          ),  // Expanded(
        ],  // children: [
      ),  // body: Column(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientHomeSearchAppointmentsPage extends StatelessWidget {
