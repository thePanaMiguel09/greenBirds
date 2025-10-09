import 'package:flutter/material.dart';
import 'package:green_birds/presentation/widgets/specie_card.dart';

class SamplingSpeciesScreen extends StatelessWidget {
  const SamplingSpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle Muestra')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SpecieCard();
        },
      ),
    );
  }
}
