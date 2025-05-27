import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'package:terapi_frontend/pages/patient/add_payment_card/add_payment_card_page.dart';

import 'payment_methods_controller.dart';

class PatientPaymentMethodsPage extends StatelessWidget {
 
  final bool seleccionDesdeCita;

  const PatientPaymentMethodsPage({super.key, this.seleccionDesdeCita = false});

  @override
  Widget build(BuildContext context) {  // Identificar si viene desde `appointment details` (Al tocar una Card ddebe poder seleccionar una tarjeta para pagar) o `profile` (Al tocar una Card debe mostrar su información para editarla)

    final controller = Get.put(PatientPaymentMethodsController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Métodos de pago'),

      body: Obx(() => ListView(

            padding: const EdgeInsets.all(16),
            children: [

              ...controller.methods.asMap().entries.map((entry) {
                final index = entry.key;
                final method = entry.value;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(

                    onTap: () {
                      if (seleccionDesdeCita) {
                        // Si la pantalla se usó desde appointment_details_page.dart
                        Get.back(result: method); // Retorna la tarjeta seleccionada
                      } else {
                        // Comportamiento por defecto desde perfil
                        Get.snackbar(
                          "Información",
                          "Para cambiar la tarjeta, primero debes eliminarla y registrar una nueva.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },

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

                    title: Text('${method.brand} terminada en ${method.last4}'),
                    subtitle: Text('Expira: ${method.expiration}'),
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
                      ],
                    ),
                  ),
                ),
              ),

            ],  // children
          )),  // body
    );  // Scaffold
  }  // Widget
}  // class
