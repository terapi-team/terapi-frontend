// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador
import 'help_center_controller.dart';

// CLASE
class PatientHelpCenterPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientHelpCenterPage({super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientHelpCenterController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Centro de ayuda'),

      // BODY: Lista reactiva de preguntas por categoría
      body: Obx(() => ListView(

            padding: const EdgeInsets.all(16),

            children: [

              // TÍTULO PRINCIPAL
              const Text(
                'Preguntas frecuentes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 12),

              // AGRUPACIÓN: Preguntas por categoría
              ...controller.categories.map((category) {

                // FILTRO: Preguntas que pertenecen a la categoría actual
                final items = controller.questions
                    .where((q) => q.category == category)
                    .toList();

                return Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    // ENCABEZADO DE CATEGORÍA
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

                    // LISTADO: Preguntas de la categoría
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

              // SECCIÓN: Mensaje si no encontró lo que buscaba
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
              ),  // Container(

            ],  // children: [
          )), // body: Obx(() => ListView(
    );  // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientHelpCenterPage extends StatelessWidget {
