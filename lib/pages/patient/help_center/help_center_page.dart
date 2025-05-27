import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'help_center_controller.dart';

class PatientHelpCenterPage extends StatelessWidget {

  const PatientHelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientHelpCenterController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Centro de ayuda'),

      body: Obx(() => ListView(

            padding: const EdgeInsets.all(16),

            children: [
              const Text(
                'Preguntas frecuentes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 12),

              // Agrupación por categoría
              ...controller.categories.map((category) {

                final items = controller.questions
                    .where((q) => q.category == category)
                    .toList();

                return Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Container(
                      color: const Color(0xFFF1F2F5),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      width: double.infinity,
                      child: Text(
                        category,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),

                    ...items.map((q) => ListTile(
                          title: Text(q.title),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Lógica futura: navegación a detalle
                          },
                        )),

                    const SizedBox(height: 12),

                  ],
                );
              }),

              Container(

                padding: const EdgeInsets.all(16),
                color: const Color(0xFFFFF3E0),

                child: Center(
                  child: Text(
                    '¿No encontraste lo que buscabas?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.orange.shade900),
                  ),
                ),
              ),  // Container

            ],  // children
          )), // body
    );  // Scaffold
  } // Widget
} // class
