import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomCurvedNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.transparent,
      color: const Color(0xFF26AD71),
      buttonBackgroundColor: const Color(0xFF26AD71),
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      items: const [
        Icon(Icons.home_outlined, color: Colors.white, size: 30),
        Icon(Icons.assignment_outlined, color: Colors.white, size: 30),
        Icon(Icons.pin_drop_outlined, color: Colors.white, size: 30),
        Icon(Icons.eco_outlined, color: Colors.white, size: 30),
        Icon(Icons.info_outline, color: Colors.white, size: 30),
      ],
    );
  }
}
