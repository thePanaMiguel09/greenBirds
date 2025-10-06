import 'package:flutter/material.dart';
import 'package:green_birds/presentation/providers/researchs_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final researchProvier = context.watch<ResearchsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investigaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: researchProvier.initLoading ? Text('Cargando') : Text('Data'),
    );
  }
}
