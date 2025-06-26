import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoginPageController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Por favor ingresa un email válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    return null;
  }

  Future<bool> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final String jsonString = await rootBundle.loadString('assets/data/usuarios.json');
      final Map<String, dynamic> data = jsonDecode(jsonString);

      final usuarios = data['usuarios'] as List;

      final usuarioEncontrado = usuarios.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
        orElse: () => null,
      );

      if (usuarioEncontrado != null) {
        print("✅ Login válido");
        return true;
      } else {
        Get.snackbar(
          'Error de inicio de sesión',
          'Credenciales incorrectas',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      print("⛔ Error al leer JSON: $e");
      Get.snackbar(
        'Error interno',
        'No se pudo validar el usuario',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  void navigateToApp() {
    Get.offAllNamed('/app');
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
