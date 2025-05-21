import 'package:flutter/material.dart';
import 'package:terapi_frontend/pages/edit_personal_info/patient_edit_personal_info_page.dart';
import 'package:terapi_frontend/pages/change_password/patient_change_password_page.dart';
import 'package:terapi_frontend/pages/payment_methods/patient_payment_methods_page.dart';
import 'package:terapi_frontend/pages/terms_and_conditions/patient_terms_and_conditions_page.dart';
import 'package:terapi_frontend/pages/help_center/patient_help_center_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _buildHeader(BuildContext context) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 35,
        backgroundColor: Color(0xFFFFE0B2),
        child: Icon(Icons.person, size: 35, color: Color(0xFFFFA726)),
      ),
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Juan Pérez',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'juan.perez@email.com',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      )
    ],
  );
}

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFFFFF3E0),
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFFFFA726)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton() {
  return InkWell(
    onTap: () {
      print('Cerrando sesión...');
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFCDD2), 
            ),
            child: const Icon(Icons.logout, color: Colors.red),
          ),
          const SizedBox(width: 12),
          const Text(
            'Cerrar sesión',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildOption(
            icon: Icons.person,
            title: 'Editar datos personales',
            subtitle: 'Nombre, email, teléfono',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientEditPersonalInfoPage()),
              );
            },
          ),
          _buildOption(
            icon: Icons.lock,
            title: 'Cambiar contraseña',
            subtitle: 'Actualiza tu contraseña',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientChangePasswordPage()),
              );
            },
          ),
          _buildOption(
            icon: Icons.credit_card,
            title: 'Métodos de pago',
            subtitle: 'Tarjetas y facturación',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientPaymentMethodsPage()),
              );
            },
          ),
          _buildOption(
            icon: Icons.description,
            title: 'Términos y condiciones',
            subtitle: 'Políticas de privacidad',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientTermsAndConditionsPage()),
              );
            },
          ),
          _buildOption(
            icon: Icons.help_outline,
            title: 'Centro de ayuda',
            subtitle: 'Preguntas frecuentes y soporte',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientHelpCenterPage()),
              );
            },
          ),
          GestureDetector(
            onTap: () {
            },
            child: _buildLogoutButton(),
          ),
        ],
      ),
    );
  }
}
