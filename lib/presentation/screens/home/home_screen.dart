import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investigaciones',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
