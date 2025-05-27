import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/components/setting_app_bar.dart';
import 'package:terapi_frontend/pages/patient/payment_methods/payment_methods_page.dart';

import 'appointment_details_controller.dart';

class PatientAppointmentDetailsPage extends StatelessWidget {

  const PatientAppointmentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PatientAppointmentDetailsController());

    return Scaffold(

      appBar: SettingsAppBar(title: "Detalles de la cita"),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildCard(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.orangeAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.terapeutaNombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(controller.especialidad),
                    ],
                  )
                ],
              ),
            ), // _buildCard(

            const SizedBox(height: 12),

            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _detailRow(Icons.calendar_today, "Fecha", controller.fecha),
                  _detailRow(Icons.access_time, "Hora", "${controller.hora} (${controller.duracion})"),
                  _detailRow(Icons.person, "Tipo de cita", controller.tipoCita),
                  _detailRow(Icons.place, "Modalidad", controller.modalidad),

                ],
              ),
            ), // _buildCard(

            const SizedBox(height: 12),

            _buildCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total a pagar", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(controller.total, style: const TextStyle(color: Colors.orange)),
                ],
              ),
            ), // _buildCard(

            const SizedBox(height: 12),

            _buildCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(Icons.credit_card, color: Colors.orange),
                    const SizedBox(width: 8),
                    Obx(() => Text(controller.tarjeta.value)),
                  ]),
                  TextButton(
                    onPressed: () async {
                      final metodo = await Get.to(() => const PatientPaymentMethodsPage(seleccionDesdeCita: true));
                      if (metodo != null) {
                        controller.actualizarTarjeta(metodo);
                      }
                    },
                    child: const Text("Cambiar"),
                  ),
                ],
              ),
            ), // _buildCard(

            const Spacer(),

            ElevatedButton(
              onPressed: controller.confirmarPago,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text("Confirmar y pagar"),
            ), // ElevatedButton(

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: controller.cancelar,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text("Cancelar"),
            ) // OutlinedButton(

          ], // children: [
        ), // child: Column(
      ), // body: Padding(
    ); // return Scaffold(
  } // Widget build(BuildContext context) {

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: child,
    );
  } // Widget _buildCard({required Widget child}) {

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Text(label + ": "),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  } // Widget _detailRow(IconData icon, String label, String value) {

} // class AppointmentDetailsPage extends StatelessWidget {
