import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
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
    try {
      await Future.delayed(Duration(seconds: 2));
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Credenciales incorrectas',
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