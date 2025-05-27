import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'package:terapi_frontend/pages/patient/appointment_schedules_selection/appointment_schedules_selection_page.dart';

import 'schedule_appointment_controller.dart';

class PatientScheduleAppointmentPage extends StatelessWidget {

  const PatientScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientScheduleAppointmentController());

    return Scaffold(

      appBar: SettingsAppBar(title: "Selecciona Servicio"),

      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [

            // Lista de opciones de cita
            Obx(() => Column(
              children: controller.servicios.map((servicio) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 1,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade50,
                      child: Icon(Icons.person, color: Colors.deepOrange),
                    ),
                    title: Text(servicio.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(servicio.subtitulo),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(servicio.duracion),
                        Text(servicio.precio, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    onTap: () {
                      Get.to(() => const PatientAppointmentSchedulesSelectionPage()); // Para futura update: Pasar data que permita obtener data respectiva
                    },
                  ),
                );
              }).toList(),
            )), // Obx(() => Column(

            const SizedBox(height: 16),

            // Información importante
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Información Importante", style: Theme.of(context).textTheme.titleMedium),
            ),

            const SizedBox(height: 8),
            const BulletText("Los precios que mostramos es por sesión."),
            const BulletText("Puedes cancelar tu cita hasta 24 horas antes"),
            const BulletText("El pago se realiza al momento de agendar."),

          ], // children: [
        ), // child: Column(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class ScheduleAppointmentPage extends StatelessWidget {

class BulletText extends StatelessWidget {

  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text("• ", style: TextStyle(height: 1.5)),
          Expanded(child: Text(text, style: const TextStyle(height: 1.5))),
        ],

      ), // child: Row(
    ); // return Padding(
  } // Widget build(BuildContext context) {
} // class BulletText extends StatelessWidget {
