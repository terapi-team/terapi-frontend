import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'patient_payment_methods_controller.dart';

class PatientPaymentMethodsPage extends StatelessWidget {

  const PatientPaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {

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
                  ),
                );
              }),

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
