import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'add_payment_card_controller.dart';

import '../payment_methods/payment_methods_controller.dart';

class PatientAddPaymentCardPage extends StatelessWidget {

  const PatientAddPaymentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientAddPaymentCardController());

    return Scaffold(

      appBar: const SettingsAppBar(title: 'Agregar Tarjeta'),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text('Datos de la Tarjeta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

            const SizedBox(height: 16),

            TextField(
              controller: controller.cardNumberCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de Tarjeta',
                hintText: '1234 5678 9101 1121',
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: controller.cardHolderCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del Titular',
                hintText: 'Como aparece en la tarjeta',
              ),
            ),

            const SizedBox(height: 16),

            Row(

              children: [

                Expanded(
                  child: TextField(
                    controller: controller.expiryDateCtrl,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de Vencimiento',
                      hintText: 'MM/YY',
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: TextField(
                    controller: controller.cvvCtrl,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      hintText: '***',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Obx(() => DropdownButtonFormField<String>(
                  value: controller.documentType.value,
                  items: controller.documentTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) controller.documentType.value = value;
                  },
                  decoration: const InputDecoration(labelText: 'Tipo de Documento'),
                )),

            const SizedBox(height: 16),

            TextField(
              controller: controller.documentNumberCtrl,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Número de Documento',
                hintText: 'Ingrese su número de documento',
              ),
            ),

            const SizedBox(height: 30),

            Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            if (!controller.isValid()) return;

                            controller.isLoading.value = true;

                            Future.delayed(const Duration(seconds: 2), () {
                              controller.isLoading.value = false;

                              final card = PaymentMethod(
                                brand: 'Visa',
                                last4: controller.cardNumberCtrl.text.trim().substring(controller.cardNumberCtrl.text.length - 4),
                                expiration: controller.expiryDateCtrl.text.trim(),
                              );

                              Get.back(result: card);
                            });
                          },
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Agregar Tarjeta'),
                  ),
                )), // Obx
          ],  // children
        ),  // Column
      ),  // body
    );  // Scaffold
  }  // Widget
}  // class
