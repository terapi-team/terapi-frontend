// IMPORTACIÓN: SDK y paquetes necesarios
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

// IMPORTACIÓN: Pages principales
import 'package:terapi_frontend/pages/login/login_page.dart';
import 'package:terapi_frontend/pages/register/register_page.dart';
import 'package:terapi_frontend/pages/patient/appointments/appointments_controller.dart';

import 'components/app_navigation.dart';

void main() async {
  // INICIALIZACIÓN: Asegura bindings antes de inicializar formatos
  WidgetsFlutterBinding.ensureInitialized();

  // INICIALIZACIÓN: Cargar configuración regional para fechas en español
  await initializeDateFormatting('es', null);

  // REGISTRO: Controladores necesarios a nivel global
  Get.put(PatientAppointmentsController(), permanent: true);

  // EJECUCIÓN: Lanzar la aplicación
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
