import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const CustomChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Chip(
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      label: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
