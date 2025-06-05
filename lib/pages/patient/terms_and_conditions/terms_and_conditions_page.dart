// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador
import 'terms_and_conditions_controller.dart';

// CLASE
class PatientTermsAndConditionsPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientTermsAndConditionsPage({super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientTermsAndConditionsController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Términos y condiciones'),

      // BODY: Contenido scrollable con padding
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Container(

          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: const Color(0xFFF6F7FA),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TÍTULO PRINCIPAL
              Text(
                controller.termsTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              // PÁRRAFO INTRODUCTORIO
              Text(controller.termsIntro),

              const SizedBox(height: 20),

              // SECCIONES DETALLADAS
              ...controller.sections.map((section) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // TÍTULO DE SECCIÓN
                        Text(
                          section['title']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 4),

                        // CONTENIDO DE SECCIÓN
                        Text(section['content']!),

                      ], //children: [
                    ), //child: Column(
                  )), // ...controller.sections.map((section) => Padding(
            ],  // children: [
          ),  // child: Column(
        ),  // child: Container(
      ),  // body: SingleChildScrollView(
    );  // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientTermsAndConditionsPage extends StatelessWidget {
