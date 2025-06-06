// IMPORTACIÓN: SDK y externos
import 'package:flutter/material.dart'; // Widgets y diseño base
import 'package:get/get.dart'; // GetX: estado, rutas, dependencias
import 'package:intl/intl.dart'; // Fechas y formatos internacionales
import 'package:flutter_svg/flutter_svg.dart'; // SVGs en widgets

// IMPORTACIÓN: Componentes personalizados
import 'package:terapi_frontend/components/setting_app_bar.dart';

// IMPORTACIÓN: Controladores
import 'edit_personal_info_controller.dart';

// CLASE
class PatientEditPersonalInfoPage extends StatelessWidget {

  // CONSTRUCTOR
  const PatientEditPersonalInfoPage({super.key});

  // MÉTODO: Formatear la fecha
  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // MÉTODO: Build (Reemplazo)
  @override
  Widget build(BuildContext context) {

    // INYECCIÓN: Controlador
    final controller = Get.put(PatientEditPersonalInfoController());

    return Scaffold(

      // APPBAR
      appBar: const SettingsAppBar(title: 'Datos personales'),

      // BODY
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // CAMPO: Nombre completo
            TextFormField(
              controller: controller.nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre completo'),
            ),

            const SizedBox(height: 20),

            // CAMPO: Email
            TextFormField(
              controller: controller.emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),

            const SizedBox(height: 20),

            // CAMPO: Teléfono
            TextFormField(
              controller: controller.phoneCtrl,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),

            const SizedBox(height: 30),

            // CAMPO: Fecha de nacimiento
            Obx(() => GestureDetector( // OBSERVACIÓN: Cambio de valor `controller.birthDate.value`
                  onTap: () => controller.pickBirthDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Fecha de nacimiento',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.birthDate.value != null
                              ? _formatDate(controller.birthDate.value!)
                              : 'Selecciona una fecha',
                        ),
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                )),

            const SizedBox(height: 40),

            // BOTÓN: Guardar cambios
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/save.svg',
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn),
                ),
                label: const Text('Guardar cambios'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: controller.saveChanges,
              ),
            ),

          ],  // children
        ),  // child: Column(
      ),  // body: SingleChildScrollView(
    );  // return Scaffold(
  }  // Widget build(BuildContext context) {
}  // class PatientEditPersonalInfoPage extends StatelessWidget {
