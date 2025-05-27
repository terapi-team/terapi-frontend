import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';

import 'patient_search_appointment_filters_controller.dart';

class PatientSearchAppointmentFiltersPage extends StatelessWidget {

  const PatientSearchAppointmentFiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientSearchAppointmentFiltersController());

    return Scaffold(

      appBar: SettingsAppBar(title: "Filtro"),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("¿Cuál es tu motivo de consulta?", style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 6),

              Obx(() => DropdownButtonFormField<String>(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                value: controller.motivoSeleccionado.value.isEmpty ? null : controller.motivoSeleccionado.value,
                hint: const Text("Selecciona un motivo de consulta"),
                items: controller.motivos.map((m) {
                  return DropdownMenuItem(value: m, child: Text(m));
                }).toList(),
                onChanged: (value) {
                  if (value != null) controller.motivoSeleccionado.value = value;
                },
              )),

              const SizedBox(height: 20),

              const Text("¿Ya tienes psicólogo? Búscalo por su nombre", style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 6),

              TextField(
                decoration: const InputDecoration(
                  hintText: "Buscar por nombre",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => controller.nombrePsicologo.value = value,
              ),

              const SizedBox(height: 20),

              const Text("País de tu psicólogo", style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 6),

              Obx(() => Column(
                children: controller.paises.map((pais) {
                  final seleccionado = controller.paisSeleccionado.value == pais;
                  return CheckboxListTile(
                    value: seleccionado,
                    title: Text(pais),
                    onChanged: (_) => controller.paisSeleccionado.value = seleccionado ? '' : pais,
                  );
                }).toList(),
              )),

              const SizedBox(height: 20),

              const Text("Género", style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 6),

              Obx(() => Column(
                children: controller.generos.map((genero) {
                  final seleccionado = controller.generoSeleccionado.value == genero;
                  return CheckboxListTile(
                    value: seleccionado,
                    title: Text(genero),
                    onChanged: (_) => controller.generoSeleccionado.value = seleccionado ? '' : genero,
                  );
                }).toList(),
              )),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: controller.aplicarFiltro,
                  child: const Text("Aplicar Filtro"),
                ),
              ), // SizedBox(

            ], // children: [
          ), // child: Column(
        ), // child: SingleChildScrollView(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientSearchAppointmentFiltersPage extends StatelessWidget {
