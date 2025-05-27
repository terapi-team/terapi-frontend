import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'change_password_controller.dart';

class PatientChangePasswordPage extends StatelessWidget {

  const PatientChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientChangePasswordController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Cambiar contraseña'),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextFormField(
              controller: controller.currentPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña actual'),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: controller.newPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nueva contraseña'),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: controller.confirmPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirmar nueva contraseña'),
            ),

            const SizedBox(height: 30),

            Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: controller.isLoading.value
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : SvgPicture.asset(
                            'assets/icons/save.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                    label: Text(controller.isLoading.value
                        ? 'Guardando...'
                        : 'Guardar contraseña'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.savePassword,
                  ),
                )),
          ],  // children
        ),  // column
      ),  // body
    );  // Scaffold
  } // Widget
} // PatientChangePasswordPage
