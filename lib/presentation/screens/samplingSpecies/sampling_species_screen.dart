import 'package:flutter/material.dart';
import 'package:green_birds/presentation/widgets/specie_card.dart';

class SamplingSpeciesScreen extends StatelessWidget {
  final String sampleId;
  const SamplingSpeciesScreen({super.key, required this.sampleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle Muestra $sampleId')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SpecieCard();
        },
      ),
    );
  }
}
