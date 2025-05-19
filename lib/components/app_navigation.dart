import 'package:flutter/material.dart';

import '../pages/appointment.dart';
import '../pages/chat.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import 'bottom_nav_bar.dart';
import 'main_app_bar.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // Lista de pantallas para la navegación principal
  final List<Widget> _mainPages = [
    const SearchPage(),
    const AppointmentsPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Terapi',
        onLogout: () {
          // Implementar lógica de logout
          print('Cerrando sesión...');
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _mainPages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _changePage,
      ),
    );
  }
}