
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';

import 'therapist_profile_opinions_controller.dart';

class TherapistProfileOpinionsPage extends StatelessWidget {

  const TherapistProfileOpinionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(TherapistProfileOpinionsController());

    return Scaffold(

      appBar: SettingsAppBar(title: "Opiniones de pacientes"),

      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Tu valoración", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 4),

            Obx(() => Row(
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

            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Comparte tu experiencia...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.comentario.value = value,
            ),

            const SizedBox(height: 12),

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

            Expanded(
              child: Obx(() => ListView.builder(

                itemCount: controller.opiniones.length,
                itemBuilder: (context, index) {

                  final o = controller.opiniones[index];

                  return Card(

                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(

                      padding: const EdgeInsets.all(12),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.orangeAccent,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(o.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Text(o.fecha, style: const TextStyle(color: Colors.grey)),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: List.generate(5, (i) => Icon(
                              i < o.estrellas ? Icons.star : Icons.star_border,
                              color: Colors.orange, size: 20,
                            )),
                          ),

                          const SizedBox(height: 6),

                          Text(o.comentario),

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
