import 'package:flutter/material.dart';

import '../components/setting_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  final String title;

  const SettingsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(
        title: title,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsItem(
            context,
            'Datos personales',
            Icons.person,
                () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(title: 'Datos personales'),
              ),
            ),
          ),
          _buildSettingsItem(
            context,
            'Notificaciones',
            Icons.notifications,
                () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(title: 'Notificaciones'),
              ),
            ),
          ),
          _buildSettingsItem(
            context,
            'Seguridad',
            Icons.security,
                () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(title: 'Seguridad'),
              ),
            ),
          ),
          _buildSettingsItem(
            context,
            'Ayuda',
            Icons.help,
                () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(title: 'Ayuda'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap
      ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFFA726)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}