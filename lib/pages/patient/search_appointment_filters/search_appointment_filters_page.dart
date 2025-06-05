// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador
import 'search_appointment_filters_controller.dart';

// CLASE: Página de filtros para búsqueda de citas
class PatientSearchAppointmentFiltersPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientSearchAppointmentFiltersPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientSearchAppointmentFiltersController());

    return Scaffold(

      // APPBAR
      appBar: SettingsAppBar(title: "Filtro"),

      // BODY
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // CAMPO: Motivo de consulta
              const Text("¿Cuál es tu motivo de consulta?", style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 6),

              // SELECTOR: Dropdown de motivos
              Obx(() => DropdownButtonFormField<String>( // OBSERVACIÓN: Cambio de `controller.motivoSeleccionado.value`
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

              // SECCIÓN: Búsqueda por nombre
              const Text("¿Ya tienes psicólogo? Búscalo por su nombre", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),

              // CAMPO: Búsqueda por nombre
              TextField(
                decoration: const InputDecoration(
                  hintText: "Buscar por nombre",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => controller.nombrePsicologo.value = value,
              ),
              const SizedBox(height: 20),

              // SECCIÓN: País del psicólogo
              const Text("País de tu psicólogo", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),

              // CHECKBOXES: Países disponibles
              Obx(() => Column( // OBSERVACIÓN: Cambio de `controller.paisSeleccionado.value`
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

              // SECCIÓN: Género del psicólogo
              const Text("Género", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),

              // CHECKBOXES: Géneros disponibles
              Obx(() => Column( // OBSERVACIÓN: Cambio de `controller.generoSeleccionado.value`
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

              // BOTÓN: Aplicar filtro
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
