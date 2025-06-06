// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador
import 'change_password_controller.dart';

// CLASE
class PatientChangePasswordPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientChangePasswordPage({super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientChangePasswordController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Cambiar contraseña'),

      // BODY
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // CAMPO: Contraseña actual
            TextFormField(
              controller: controller.currentPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña actual'),
            ),

            const SizedBox(height: 20),

            // CAMPO: Nueva contraseña
            TextFormField(
              controller: controller.newPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nueva contraseña'),
            ),

            const SizedBox(height: 20),

            // CAMPO: Confirmar nueva contraseña
            TextFormField(
              controller: controller.confirmPasswordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirmar nueva contraseña'),
            ),

            const SizedBox(height: 30),

            // BOTÓN: Guardar contraseña
            Obx(() => SizedBox( // OBSERVABLE: Cambio de `controller.isLoading.value`
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
        ),  // child: Column(
      ),  // body: SingleChildScrollView(
    );  // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientChangePasswordPage extends StatelessWidget {
