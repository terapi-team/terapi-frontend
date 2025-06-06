// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart'; // Widgets y diseño base
import 'package:get/get.dart'; // GetX: estado, rutas, dependencias

// CLASE
class PatientEditPersonalInfoController extends GetxController {

   // ATRIBUTOS: Controladores de texto
  final nameCtrl = TextEditingController(); // ATRIBUTO: Nombre
  final emailCtrl = TextEditingController(); // ATRIBUTO: Email
  final phoneCtrl = TextEditingController(); // ATRIBUTO: Teléfono

  // ATRIBUTO: Fecha de nacimiento (Observable)
  final birthDate = Rx<DateTime?>(null);

  // ATRIBUTO: Estado de carga (Observable)
  final isLoading = false.obs;

 // MÉTODO: onInit
  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  // MÉTODO: Cargar datos iniciales
  void _loadInitialData() {
    nameCtrl.text = 'Juan Pérez';
    emailCtrl.text = 'juan.perez@email.com';
    phoneCtrl.text = '999888777';
    birthDate.value = DateTime(1990, 1, 1);
  }

  // MÉTODO: Seleccionar fecha de nacimiento
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

  // MÉTODO: Guardar cambios
  Future<void> saveChanges() async {

    if (!_isValid()) return;

    isLoading.value = true;

    try {

      // Simulación de espera por backend
      await Future.delayed(const Duration(seconds: 2));

      // Impresión de datos en consola
      print('Nombre: ${nameCtrl.text}');
      print('Email: ${emailCtrl.text}');
      print('Teléfono: ${phoneCtrl.text}');
      print('Fecha de nacimiento: ${birthDate.value?.toIso8601String()}');

      // Snackbar: Notificación de éxito
      Get.snackbar('Éxito', 'Cambios guardados correctamente',
          snackPosition: SnackPosition.BOTTOM);

    } catch (e) {

      // Snackbar: Notificación de error
      Get.snackbar('Error', 'No se pudo guardar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);

    } finally {

      isLoading.value = false;

    }
  }

  // MÉTODO: Validar campos del formulario
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

  // MÉTODO: onClose (dispose de controladores)
  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.onClose();
  }
}
