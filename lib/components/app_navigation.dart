import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'main_app_bar.dart';

import '../pages/home_search_appointments/home_search_appointments_page.dart';
import '../pages/appointments/appointments_page.dart';
import '../pages/chat.dart';
import '../pages/profile.dart';

class AppNavigation extends StatefulWidget {

  final int initialIndex;
  const AppNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();

}

class _AppNavigationState extends State<AppNavigation> {

  late int _currentIndex;
  late PageController _pageController;

  // Lista de pantallas para la navegación principal
  final List<Widget> _mainPages = [
    const HomeSearchAppointmentsPage(),
    const AppointmentsPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

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
