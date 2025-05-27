import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientEditPersonalInfoController extends GetxController {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final birthDate = Rx<DateTime?>(null);

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    nameCtrl.text = 'Juan Pérez';
    emailCtrl.text = 'juan.perez@email.com';
    phoneCtrl.text = '999888777';
    birthDate.value = DateTime(1990, 1, 1);
  }

  void pickBirthDate(BuildContext context) async {

    DateTime initial = birthDate.value ?? DateTime(1990, 1, 1);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDate.value = picked;
    }

  }

  Future<void> saveChanges() async {

    if (!_isValid()) return;

    isLoading.value = true;

    try {

      await Future.delayed(const Duration(seconds: 2));

      print('Nombre: ${nameCtrl.text}');
      print('Email: ${emailCtrl.text}');
      print('Teléfono: ${phoneCtrl.text}');
      print('Fecha de nacimiento: ${birthDate.value?.toIso8601String()}');

      Get.snackbar('Éxito', 'Cambios guardados correctamente',
          snackPosition: SnackPosition.BOTTOM);

    } catch (e) {

      Get.snackbar('Error', 'No se pudo guardar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);

    } finally {

      isLoading.value = false;

    }
  }

  bool _isValid() {

    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final phone = phoneCtrl.text.trim();

    if (name.isEmpty) {
      Get.snackbar('Campo requerido', 'El nombre no puede estar vacío');
      return false;
    }

    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(name)) {
      Get.snackbar('Nombre inválido', 'Solo se permiten letras en el nombre');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Correo inválido', 'Ingresa un correo válido');
      return false;
    }

    if (phone.length < 6) {
      Get.snackbar('Teléfono inválido', 'Ingresa un número válido');
      return false;
    }

    if (!RegExp(r'^\+?[0-9]{6,}$').hasMatch(phone)) {
      Get.snackbar('Teléfono inválido', 'Solo números permitidos');
      return false;
    }

    if (birthDate.value == null) {
      Get.snackbar('Campo requerido', 'Selecciona tu fecha de nacimiento');
      return false;
    }

    return true;

  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.onClose();
  }
}
