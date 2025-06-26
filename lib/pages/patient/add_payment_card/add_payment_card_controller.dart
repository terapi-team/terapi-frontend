// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// CLASE
class PatientAddPaymentCardController extends GetxController {

  // ATRIBUTOS: Controladores de texto para los campos del formulario
  final cardNumberCtrl = TextEditingController();     // ATRIBUTO: Número de tarjeta
  final cardHolderCtrl = TextEditingController();     // ATRIBUTO: Nombre del titular
  final expiryDateCtrl = TextEditingController();     // ATRIBUTO: Fecha de expiración (MM/YY)
  final cvvCtrl = TextEditingController();            // ATRIBUTO: Código CVV
  final documentNumberCtrl = TextEditingController(); // ATRIBUTO: Número de documento

  // ATRIBUTO: Tipo de documento seleccionado (observable)
  final documentType = 'DNI'.obs;

  // ATRIBUTO: Estado de carga (observable)
  final isLoading = false.obs;

  // ATRIBUTO: Lista de tipos de documentos disponibles
  final List<String> documentTypes = ['DNI', 'Carnet de Extranjería', 'Pasaporte'];

  // MÉTODO: Enviar formulario de tarjeta
  void submitCard() {

    if (!isValid()) return;

    isLoading.value = true;

    // Simulación de procesamiento de backend
    Future.delayed(const Duration(seconds: 2), () {

      isLoading.value = false;

      // NAVEGACIÓN: Regresa a la vista anterior
      Get.back();

      // SNACKBAR: Confirmación de éxito
      Get.snackbar('Éxito', 'Tarjeta agregada correctamente',
          snackPosition: SnackPosition.BOTTOM);
    });

  } // void submitCard() {

  // MÉTODO: Validar campos del formulario
  bool isValid() {

    if (cardNumberCtrl.text.length < 16) {
      Get.snackbar('Número inválido', 'Ingresa un número de tarjeta válido');
      return false;
    }

    if (cardHolderCtrl.text.trim().isEmpty) {
      Get.snackbar('Campo requerido', 'Ingresa el nombre del titular');
      return false;
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])/\d{2}$').hasMatch(expiryDateCtrl.text.trim())) {
      Get.snackbar('Fecha inválida', 'Formato correcto: MM/YY');
      return false;
    }

    if (cvvCtrl.text.length != 3) {
      Get.snackbar('CVV inválido', 'El CVV debe tener 3 dígitos');
      return false;
    }

    if (documentNumberCtrl.text.trim().isEmpty) {
      Get.snackbar('Campo requerido', 'Ingresa el número de documento');
      return false;
    }

    return true;

  } // bool isValid() {

  // MÉTODO: onClose (dispose de controladores)
  @override
  void onClose() {

    cardNumberCtrl.dispose();
    cardHolderCtrl.dispose();
    expiryDateCtrl.dispose();
    cvvCtrl.dispose();
    documentNumberCtrl.dispose();
    super.onClose();

  }

} // class PatientAddPaymentCardController extends GetxController {