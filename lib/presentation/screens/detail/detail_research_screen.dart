import 'package:flutter/material.dart';

class DetailResearchScreen extends StatelessWidget {
  const DetailResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle/Investigaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
