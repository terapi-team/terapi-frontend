import 'package:flutter/material.dart';
import 'package:terapi_frontend/pages/register/register_controller.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterPageController _controller = RegisterPageController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (_controller.formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      bool registerSuccess = await _controller.register();

      setState(() {
        _isLoading = false;
      });

      if (registerSuccess) {
        _controller.navigateToLogin();
      }
    }
  }

  void _navigateToLogin() {
    _controller.navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E6D3),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Form(
                key: _controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF8A50).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.person_add,
                        size: 30,
                        color: Color(0xFFFF8A50),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Crear Cuenta',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 32),
                    AuthInputField(
                      label: 'Nombre completo',
                      controller: _controller.nameController,
                      validator: _controller.validateName,
                    ),
                    SizedBox(height: 20),
                    AuthInputField(
                      label: 'Email',
                      controller: _controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _controller.validateEmail,
                    ),
                    SizedBox(height: 20),
                    AuthInputField(
                      label: 'Contraseña',
                      controller: _controller.passwordController,
                      obscureText: true,
                      validator: _controller.validatePassword,
                    ),
                    SizedBox(height: 20),
                    AuthInputField(
                      label: 'Confirmar Contraseña',
                      controller: _controller.confirmPasswordController,
                      obscureText: true,
                      validator: _controller.validateConfirmPassword,
                    ),
                    SizedBox(height: 32),
                    AuthButton(
                      text: 'Registrarse',
                      onPressed: _handleRegister,
                      isLoading: _isLoading,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes una cuenta? ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        GestureDetector(
                          onTap: _navigateToLogin,
                          child: Text(
                            'Inicia sesión',
                            style: TextStyle(
                              color: Color(0xFFFF8A50),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}