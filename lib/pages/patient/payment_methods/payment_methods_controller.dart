// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// IMPORTACIÓN: Páginas internas
import 'package:terapi_frontend/pages/patient/add_payment_card/add_payment_card_page.dart';

// CLASE: Modelo de método de pago
class PaymentMethod {

  // ATRIBUTOS: Datos del método de pago
  final String brand;
  final String last4;
  final String expiration;

  // CONSTRUCTOR
  PaymentMethod({
    required this.brand,
    required this.last4,
    required this.expiration});

}

// CLASE
class PatientPaymentMethodsController extends GetxController {

  // ATRIBUTO: Lista observable de métodos de pago
  final methods = <PaymentMethod>[].obs;

  // MÉTODO: onInit
  @override
  void onInit() {
    super.onInit();
    _loadInitialMethods();
  }

  // MÉTODO: Cargar métodos de pago simulados
  void _loadInitialMethods() {
    methods.assignAll([
      PaymentMethod(brand: 'Visa', last4: '4242', expiration: '12/24'),
      PaymentMethod(brand: 'Mastercard', last4: '8888', expiration: '09/25'),
    ]);
  }

  // MÉTODO: Eliminar un método de pago
  void removeMethod(int index) {

    methods.removeAt(index);

    // SNACKBAR: Confirmación de eliminación
    Get.snackbar('Eliminado', 'Método de pago eliminado');

  }

  // MÉTODO: Ir a agregar tarjeta y actualizar lista
  void addNewCard() async {

    // NAVEGACIÓN: Navega a `PatientAddPaymentCardPage` (`add_payment_card_page.dart.dart`)
    final result = await Get.to(() => const PatientAddPaymentCardPage());

    if (result != null && result is PaymentMethod) {

      methods.add(result);

      // SNACKBAR: Confirmación de adición
      Get.snackbar('Éxito', 'Método de pago agregado');

    }
  }
}
