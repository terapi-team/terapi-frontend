import 'package:get/get.dart';

import 'package:terapi_frontend/pages/patient/add_payment_card/add_payment_card_page.dart';

class PaymentMethod {

  final String brand;
  final String last4;
  final String expiration;

  PaymentMethod({required this.brand, required this.last4, required this.expiration});

}

class PatientPaymentMethodsController extends GetxController {

  final methods = <PaymentMethod>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialMethods();
  }

  void _loadInitialMethods() {
    methods.assignAll([
      PaymentMethod(brand: 'Visa', last4: '4242', expiration: '12/24'),
      PaymentMethod(brand: 'Mastercard', last4: '8888', expiration: '09/25'),
    ]);
  }

  void removeMethod(int index) {
    methods.removeAt(index);
    Get.snackbar('Eliminado', 'Método de pago eliminado');
  }

  void addNewCard() async {

    final result = await Get.to(() => const PatientAddPaymentCardPage()); // Direcciona a la pantalla para agregar la tarjeta

    if (result != null && result is PaymentMethod) {
      methods.add(result);
      Get.snackbar('Éxito', 'Método de pago agregado');
    }
  }
}
