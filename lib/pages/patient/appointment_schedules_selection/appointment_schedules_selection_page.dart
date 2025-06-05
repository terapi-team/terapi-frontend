// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Página de detalles de cita
import 'package:terapi_frontend/pages/patient/appointment_details/appointment_details_page.dart';

// IMPORTACIÓN: Controlador
import 'appointment_schedules_selection_controller.dart';

// CLASE
class PatientAppointmentSchedulesSelectionPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientAppointmentSchedulesSelectionPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientAppointmentSchedulesSelectionController());

    return Scaffold(

      // APPBAR
      appBar: SettingsAppBar(title: "Selecciona una hora"),

      // BODY: Contenido principal con padding
      body: Padding(

        padding: const EdgeInsets.all(16),
        child: Column(

          children: [

            // SECCIÓN: Selector de fechas (reactivo)
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.fechas.length, (index) {
                final selected = controller.fechaSeleccionada.value == index;
                return GestureDetector(
                  onTap: () => controller.fechaSeleccionada.value = index,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: selected ? Colors.orange : Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: selected ? Colors.orange.shade50 : null,
                    ),
                    child: Text(
                      controller.fechas[index].replaceAll("\n", "\n"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selected ? Colors.orange : Colors.black,
                        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            )), // Obx(() => Row(

            const SizedBox(height: 16),

            // SECCIÓN: Cuadrícula de horarios disponibles
            Expanded(
              child: Obx(() => GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: controller.horarios.map((slot) {
                  final seleccionado = controller.horarioSeleccionado.value == slot.hora;
                  return GestureDetector(
                    onTap: slot.disponible ? () => controller.seleccionarHorario(slot.hora) : null,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: !slot.disponible
                          ? Colors.grey.shade300
                          : seleccionado
                            ? Colors.orange
                            : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: seleccionado ? Colors.deepOrange : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        slot.hora,
                        style: TextStyle(
                          color: !slot.disponible ? Colors.grey : Colors.black,
                          fontWeight: seleccionado ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
            ), // Expanded(

            const SizedBox(height: 16),

            // BLOQUE: Duración y precio del servicio
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text("Duración: ${controller.duracion}"),
                  ]),
                  Row(children: [
                    const Icon(Icons.monetization_on_outlined, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text("Precio: ${controller.precio}"),
                  ]),
                ],
              ),
            ), // Container(

            const SizedBox(height: 12),

            // BOTÓN: Confirmar horario seleccionado
            Obx(() => ElevatedButton(
              onPressed: controller.horarioSeleccionado.value.isEmpty
                ? null
                : () {
                  // NAVEGACIÓN: Ir a pantalla de detalles de cita
                  Get.to(() => const PatientAppointmentDetailsPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text("Confirmar horario"),
            )), // Obx(() => ElevatedButton(

          ], // children: [
        ), // child: Column(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class AppointmentSchedulesSelectionPage extends StatelessWidget {
