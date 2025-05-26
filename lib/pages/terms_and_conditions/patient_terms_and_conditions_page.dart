import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'patient_terms_and_conditions_controller.dart';

class PatientTermsAndConditionsPage extends StatelessWidget {

  const PatientTermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientTermsAndConditionsController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Términos y condiciones'),

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

              Text(
                controller.termsTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              Text(controller.termsIntro),

              const SizedBox(height: 20),

              ...controller.sections.map((section) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section['title']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(section['content']!),
                      ],
                    ),
                  )), // ...controller.sections.map
            ],  // children
          ),  // Column
        ),  // Container
      ),  // body
    );  // Scaffold
  } // Widget
} // class PatientTermsAndConditionsPage
