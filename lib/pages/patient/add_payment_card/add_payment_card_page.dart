// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controlador de esta vista
import 'add_payment_card_controller.dart';

// IMPORTACIÓN: Modelo para retornar tarjeta
import '../payment_methods/payment_methods_controller.dart';

// CLASE
class PatientAddPaymentCardPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientAddPaymentCardPage({super.key});

  // MÉTODO: Build
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientAddPaymentCardController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Agregar Tarjeta'),

      // BODY: Formulario scrollable
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TÍTULO DE SECCIÓN
            const Text('Datos de la Tarjeta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

            const SizedBox(height: 16),

            // CAMPO: Número de tarjeta
            TextField(
              controller: controller.cardNumberCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de Tarjeta',
                hintText: '1234 5678 9101 1121',
              ),
            ),

            const SizedBox(height: 16),

            // CAMPO: Nombre del titular
            TextField(
              controller: controller.cardHolderCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del Titular',
                hintText: 'Como aparece en la tarjeta',
              ),
            ),

            const SizedBox(height: 16),

            // FILA: Fecha de vencimiento y CVV
            Row(
              children: [

                // CAMPO: Fecha de vencimiento
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

                // CAMPO: CVV
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

            // OBSERVABLE: Dropdown de tipo de documento, cambio de `controller.documentType.value`
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

            // CAMPO: Número de documento
            TextField(
              controller: controller.documentNumberCtrl,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Número de Documento',
                hintText: 'Ingrese su número de documento',
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN: Agregar tarjeta (reactivo a estado de carga)
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

                            // VALIDACIÓN
                            if (!controller.isValid()) return;

                            // CAMBIO DE ESTADO
                            controller.isLoading.value = true;

                            // SIMULACIÓN DE ENVÍO Y RETORNO DE TARJETA
                            Future.delayed(const Duration(seconds: 2), () {
                              controller.isLoading.value = false;

                              final card = PaymentMethod(
                                brand: 'Visa',
                                last4: controller.cardNumberCtrl.text.trim().substring(controller.cardNumberCtrl.text.length - 4),
                                expiration: controller.expiryDateCtrl.text.trim(),
                              );

                              // RETORNO: Devuelve la tarjeta nueva
                              Get.back(result: card);

                            });
                          },

                    // TEXTO O CARGA DEPENDIENDO DEL ESTADO
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Agregar Tarjeta'),
                  ),
                )), // Obx(() => SizedBox(
          ],  // children: [
        ),  // child: Column(
      ),  // body: SingleChildScrollView(
    );  // return Scaffold(
  }  // Widget build(BuildContext context) {
}  // class PatientAddPaymentCardPage extends StatelessWidget {
