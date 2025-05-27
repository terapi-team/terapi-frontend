import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'edit_personal_info_controller.dart';

class PatientEditPersonalInfoPage extends StatelessWidget {

  const PatientEditPersonalInfoPage({super.key});

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientEditPersonalInfoController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Datos personales'),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextFormField(
              controller: controller.nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre completo'),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: controller.emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: controller.phoneCtrl,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),

            const SizedBox(height: 30),

            Obx(() => GestureDetector(
                  onTap: () => controller.pickBirthDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Fecha de nacimiento',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.birthDate.value != null
                              ? _formatDate(controller.birthDate.value!)
                              : 'Selecciona una fecha',
                        ),
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                )),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/save.svg',  // Puedes cambiarlo a otro si prefieres
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn),
                ),
                label: const Text('Guardar cambios'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: controller.saveChanges,
              ),
            ),

          ],  // children
        ),  // child
      ),  // body
    );  // Scaffold
  }  // Widget
}  // class
