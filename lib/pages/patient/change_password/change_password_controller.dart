// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// CLASE
class PatientChangePasswordController extends GetxController {

  // ATRIBUTOS: Controladores de texto
  final currentPasswordCtrl = TextEditingController(); // ATRIBUTO: Contraseña actual
  final newPasswordCtrl = TextEditingController(); // ATRIBUTO: Nueva contraseña
  final confirmPasswordCtrl = TextEditingController(); // ATRIBUTO: Nueva contraseña (Confirmación)

  // ATRIBUTO: Estado de carga (Observable)
  final isLoading = false.obs;

  // MÉTODO: Guardar nueva contraseña
  Future<void> savePassword() async {

    if (!_isValid()) return;
    isLoading.value = true;

    try {
      
      // Simulación de espera por backend
      await Future.delayed(const Duration(seconds: 2));

      // Impresión de datos en consola
      print('Contraseña actual: ${currentPasswordCtrl.text}');
      print('Nueva contraseña: ${newPasswordCtrl.text}');

      // Snackbar: Notificación de éxito
      Get.snackbar('Éxito', 'Contraseña actualizada correctamente',
          snackPosition: SnackPosition.BOTTOM);

    } catch (e) {

      // Snackbar: Notificación de error
      Get.snackbar('Error', 'No se pudo actualizar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);

    } finally {

      isLoading.value = false;

    }
  }

  // MÉTODO: Validar campos del formulario
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

  // MÉTODO: onClose (dispose de controladores)
  @override
  void onClose() {
    currentPasswordCtrl.dispose();
    newPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.onClose();
  }
}
