// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Página siguiente del flujo
import 'package:terapi_frontend/pages/patient/appointment_schedules_selection/appointment_schedules_selection_page.dart';

// IMPORTACIÓN: Controlador
import 'schedule_appointment_controller.dart';

// CLASE: Página para seleccionar tipo de servicio de cita
class PatientScheduleAppointmentPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientScheduleAppointmentPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientScheduleAppointmentController());

    return Scaffold(

      // APPBAR: Título superior
      appBar: SettingsAppBar(title: "Selecciona Servicio"),

      // BODY: Contenedor con padding general
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [

            // SECCIÓN: Lista de servicios disponibles (reactiva)
            Obx(() => Column(
              children: controller.servicios.map((servicio) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 1,

                  child: ListTile(

                    // ICONO: Avatar
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade50,
                      child: Icon(Icons.person, color: Colors.deepOrange),
                    ),

                    // TÍTULO: Nombre del servicio
                    title: Text(servicio.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),

                    // SUBTÍTULO: Descripción del servicio
                    subtitle: Text(servicio.subtitulo),

                    // PRECIO Y DURACIÓN: Alineados a la derecha
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(servicio.duracion),
                        Text(servicio.precio, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),

                    // ACCIÓN: Ir a selección de horarios
                    onTap: () {
                      Get.to(() => const PatientAppointmentSchedulesSelectionPage()); // NAVEGACIÓN
                    },

                  ), // child: ListTile(
                ); // return Card(
              }).toList(), // children: controller.servicios.map((servicio) {

            )), // Obx(() => Column(

            const SizedBox(height: 16),

            // TÍTULO: Información importante
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Información Importante", style: Theme.of(context).textTheme.titleMedium),
            ),

            const SizedBox(height: 8),

            // TEXTO: Lista de puntos informativos
            const BulletText("Los precios que mostramos es por sesión."),
            const BulletText("Puedes cancelar tu cita hasta 24 horas antes"),
            const BulletText("El pago se realiza al momento de agendar."),

          ], // children: [
        ), // child: Column(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientScheduleAppointmentPage extends StatelessWidget {

// CLASE: Widget para mostrar texto con viñeta (•)
class BulletText extends StatelessWidget {

  // ATRIBTUTO: Texto
  final String text;

  // CONSTRUCTOR
  const BulletText(this.text, {super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // SÍMBOLO: Viñeta
          const Text("• ", style: TextStyle(height: 1.5)),

          // TEXTO: Contenido asociado
          Expanded(child: Text(text, style: const TextStyle(height: 1.5))),

        ],

      ), // child: Row(
    ); // return Padding(
  } // Widget build(BuildContext context) {
} // class BulletText extends StatelessWidget {
