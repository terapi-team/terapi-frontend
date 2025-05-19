import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, SvgPicture.asset('assets/icons/search.svg', width: 20, height: 20), 'Buscar cita'),
              _buildNavItem(1, SvgPicture.asset('assets/icons/calendar.svg', width: 20, height: 20), 'Tus citas'),
              _buildNavItem(2, SvgPicture.asset('assets/icons/message-square.svg', width: 20, height: 20), 'Chats'),
              _buildNavItem(3, SvgPicture.asset('assets/icons/user.svg', width: 20, height: 20), 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNavItem(int index, SvgPicture picture, String label) {
    final bool isSelected = currentIndex == index;
    final Color color = isSelected ? const Color(0xFFFFA726) : Colors.grey;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          picture,
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}