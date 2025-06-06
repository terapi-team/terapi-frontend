// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Páginas internas
import 'package:terapi_frontend/pages/patient/add_payment_card/add_payment_card_page.dart';

// IMPORTACIÓN: Controlador
import 'payment_methods_controller.dart';

// CLASE
class PatientPaymentMethodsPage extends StatelessWidget {
 
  // ATRIBUTO: Define si se accedió desde `PatientAppointmentDetailsPage` (appointment_details_page.dart)
  final bool seleccionDesdeCita;

  // CONSTRUCTOR
  const PatientPaymentMethodsPage({super.key, this.seleccionDesdeCita = false});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientPaymentMethodsController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Métodos de pago'),

      // BODY: Lista de tarjetas observables
      body: Obx(() => ListView(

            padding: const EdgeInsets.all(16),
            children: [

              // LISTA: Tarjetas registradas
              ...controller.methods.asMap().entries.map((entry) {
                final index = entry.key;
                final method = entry.value;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(

                    // COMPORTAMIENTO: Según origen de navegación
                    onTap: () {

                      // CONDICIONAL: Si ha navegado desde `PatientAppointmentDetailsPage` (`appointment_details_page.dart`)
                      if (seleccionDesdeCita) {

                        // RETORNO: PaymentMethod (Nota: Tarjeta seleccionada)
                        Get.back(result: method);

                      }
                      
                      // ELSE: Si ha navegado desde `PatientProfilePage` (`profile.dart`)
                      else {
                        Get.snackbar(
                          "Información",
                          "Para cambiar la tarjeta, primero debes eliminarla y registrar una nueva.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },

                    // ICONO: Marca de tarjeta
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFFFF3E0),
                      child: SvgPicture.asset(
                        'assets/icons/credit-card.svg',
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                            Color(0xFFFFA726), BlendMode.srcIn),
                      ),
                    ),

                    // INFORMACIÓN: Marca y terminación
                    title: Text('${method.brand} terminada en ${method.last4}'),
                    subtitle: Text('Expira: ${method.expiration}'),

                    // BOTÓN: Eliminar tarjeta
                    trailing: TextButton(
                      onPressed: () => controller.removeMethod(index),
                      child: const Text(
                        'Eliminar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  ), // child: ListTile(
                ); // return Card(
              }), // ...controller.methods.asMap().entries.map((entry) {

              // BOTÓN: Agregar nueva tarjeta
              GestureDetector(
                onTap: controller.addNewCard,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 1),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8),
                        const Text('Agregar nueva tarjeta'),
                      ], // children: [
                    ), // child: Row(
                  ), // child: Center(
                ), // child: Container(
              ), // GestureDetector(

            ], // children: [
          )), // body: Obx(() => ListView(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {
} // class PatientPaymentMethodsPage extends StatelessWidget {
