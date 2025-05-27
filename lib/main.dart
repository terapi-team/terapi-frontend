import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/app_navigation.dart';
import 'pages/patient/appointments/appointments_controller.dart';

void main() {

  // Inyecta globalmente el controlador de citas para que esté disponible en toda la app
  Get.put(PatientAppointmentsController());

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Terapi',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: const Color(0xFFFFA726),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA726)),
        useMaterial3: true,
      ),

      home: const AppNavigation(),

    ); // return GetMaterialApp(
  } // Widget build(BuildContext context)
} // class MyApp extends StatelessWidget
