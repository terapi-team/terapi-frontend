// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador
import 'therapist_profile_opinions_controller.dart';

// CLASE: Página para mostrar y publicar opiniones de pacientes
class PatientTherapistProfileOpinionsPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientTherapistProfileOpinionsPage({Key? key}) : super(key: key);

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientTherapistProfileOpinionsController());

    return Scaffold(

      // APPBAR
      appBar: SettingsAppBar(title: "Opiniones de pacientes"),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // SECCIÓN: Título de valoración
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Tu valoración", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 4),

            // SECCIÓN: Estrellas seleccionables (reactiva)
            Obx(() => Row( // OBSERVACIÓN: Cambio de `controller.valoracion.value`
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < controller.valoracion.value
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () => controller.valoracion.value = index + 1,
                );
              }),
            )),

            // CAMPO: Comentario del paciente
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Comparte tu experiencia...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.comentario.value = value,
            ),

            const SizedBox(height: 12),

            // BOTÓN: Publicar comentario
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: controller.publicarComentario,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Publicar comentario"),
              ),
            ),

            const SizedBox(height: 16),

            // SECCIÓN: Lista de opiniones
            Expanded(
              child: Obx(() => ListView.builder( // OBSERVACIÓN: Cambio de ``

                itemCount: controller.opiniones.length,
                itemBuilder: (context, index) {

                  final opi = controller.opiniones[index];

                  return Card(

                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(

                      padding: const EdgeInsets.all(12),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // CABECERA: Avatar, nombre, fecha
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.orangeAccent,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(opi.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Text(opi.fecha, style: const TextStyle(color: Colors.grey)),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // ESTRELLAS: Valoración visual
                          Row(
                            children: List.generate(5, (i) => Icon(
                              i < opi.estrellas ? Icons.star : Icons.star_border,
                              color: Colors.orange, size: 20,
                            )),
                          ),

                          const SizedBox(height: 6),

                          // TEXTO: Comentario del paciente
                          Text(opi.comentario),

                        ], // children: [
                      ), // child: Column(
                    ), // child: Padding(
                  ); // return Card(
                }, // itemBuilder: (context, index) {
              )), // child: Obx(() => ListView.builder(
            ), // Expanded(
          ], // children: [
        ), // child: Column(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class TherapistProfileOpinionsPage extends StatelessWidget {
