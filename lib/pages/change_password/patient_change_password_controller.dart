import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientChangePasswordController extends GetxController {

  final currentPasswordCtrl = TextEditingController();
  final newPasswordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  final isLoading = false.obs;

  Future<void> savePassword() async {

    if (!_isValid()) return;
    isLoading.value = true;

    try {
      
      await Future.delayed(const Duration(seconds: 2)); // Simulación de petición

      print('Contraseña actual: ${currentPasswordCtrl.text}'); // Mostrar en terminal, hecho para visualizar el correcto funcionamiento
      print('Nueva contraseña: ${newPasswordCtrl.text}');      // Mostrar en terminal, hecho para visualizar el correcto funcionamiento

      Get.snackbar('Éxito', 'Contraseña actualizada correctamente',
          snackPosition: SnackPosition.BOTTOM);

    } catch (e) {

      Get.snackbar('Error', 'No se pudo actualizar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);

    } finally {

      isLoading.value = false;

    }
  }

  bool _isValid() {

    final current = currentPasswordCtrl.text.trim();
    final newPass = newPasswordCtrl.text.trim();
    final confirm = confirmPasswordCtrl.text.trim();

    if (current.isEmpty || newPass.isEmpty || confirm.isEmpty) {
      Get.snackbar('Campos requeridos', 'Completa todos los campos');
      return false;
    }

    if (newPass.length < 6) {
      Get.snackbar('Contraseña inválida', 'Debe tener al menos 6 caracteres');
      return false;
    }

    if (newPass != confirm) {
      Get.snackbar('No coincide', 'La confirmación no coincide con la nueva contraseña');
      return false;
    }

    if (current == newPass) {
      Get.snackbar('Inválido', 'La nueva contraseña no puede ser igual a la actual');
      return false;
    }

    return true;

  }

  @override
  void onClose() {
    currentPasswordCtrl.dispose();
    newPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.onClose();
  }
}
