import 'package:flutter/material.dart';

final List<Color> colors = [Color(0xFF26AD71)];

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true
        
        ),
      
    );
  }
}
