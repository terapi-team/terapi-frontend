// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Controlador
import 'appointments_controller.dart';

// CLASE
class PatientAppointmentsPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientAppointmentsPage({super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientAppointmentsController());

    return Scaffold(

      // APPBAR
      appBar: AppBar(
        title: const Text("Tus Citas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),

      // BODY: Scroll reactivo con próximas e historial
      body: Obx(() => SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // TÍTULO: Próximas citas
                const Text("Próximas citas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // LISTADO: Próximas citas
                ...controller.proximas.map((cita) => _citaCard(cita)),

                const SizedBox(height: 24),

                // TÍTULO: Historial
                const Text("Historial de citas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // MENSAJE: Si no hay historial
                if (controller.historial.isEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      const Center(child: Icon(Icons.calendar_today, size: 60, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Center(child: Text("No hay citas", style: TextStyle(color: Colors.grey)))
                    ],
                  )

                // LISTADO: Citas anteriores
                else
                  ...controller.historial.map((cita) => _citaCard(cita)),

              ], // children: [
            ), // child: Column(
          )), // body: Obx(() => SingleChildScrollView(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {

  // MÉTODO: Widget reutilizable para mostrar una cita
  Widget _citaCard(Appointment cita) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // INFORMACIÓN: Terapeuta
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(cita.imagen), radius: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cita.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(cita.especialidad),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // DETALLES: Fecha, hora, modalidad
          Row(children: [const Icon(Icons.calendar_today, size: 16), const SizedBox(width: 4), Text(cita.fecha)]),
          Row(children: [const Icon(Icons.access_time, size: 16), const SizedBox(width: 4), Text(cita.hora)]),
          Row(children: [const Icon(Icons.location_on, size: 16), const SizedBox(width: 4), Text(cita.modalidad)]),

          const SizedBox(height: 12),

          // ACCIONES: Botón de sesión y chat
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.video_call),
                  label: const Text("Unirse a sesión"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                child: const Icon(Icons.chat_bubble_outline, color: Colors.orange),
              )
            ], // children: [
          ) // Row(
        ], // children: [
      ), // child: Column(
    ); // return Container(
  } // Widget _citaCard(Appointment cita) {
} // class AppointmentsPage extends StatelessWidget {
