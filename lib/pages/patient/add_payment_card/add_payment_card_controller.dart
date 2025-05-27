import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientAddPaymentCardController extends GetxController {

  final cardNumberCtrl = TextEditingController();
  final cardHolderCtrl = TextEditingController();
  final expiryDateCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();
  final documentType = 'DNI'.obs;
  final documentNumberCtrl = TextEditingController();

  final isLoading = false.obs;

  final List<String> documentTypes = ['DNI', 'Carnet de Extranjería', 'Pasaporte'];

  void submitCard() {

    if (!isValid()) return;

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.back();
      Get.snackbar('Éxito', 'Tarjeta agregada correctamente',
          snackPosition: SnackPosition.BOTTOM);
    });

  } // submitCard

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

  } // isValid

  @override
  void onClose() {

    cardNumberCtrl.dispose();
    cardHolderCtrl.dispose();
    expiryDateCtrl.dispose();
    cvvCtrl.dispose();
    documentNumberCtrl.dispose();
    super.onClose();

  }

}
