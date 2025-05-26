import 'package:get/get.dart';

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

  void addNewCard() {
    // Navegar al formulario de la tarjeta, agregarla ❗❗❗
    Get.snackbar('Agregar tarjeta', 'Función no implementada');
  }

}
