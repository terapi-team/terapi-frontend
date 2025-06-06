import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapi_frontend/pages/login/login_page.dart';
import 'package:terapi_frontend/pages/register/register_page.dart';
import 'package:terapi_frontend/pages/patient/appointments/appointments_controller.dart';

import 'components/app_navigation.dart';

void main() {
  // REGISTRO: Controladores necesarios a nivel global
  Get.put(PatientAppointmentsController(), permanent: true);

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
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/app', page: () => const AppNavigation()),
      ],
    );
  }
}
