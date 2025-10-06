// presentation/widgets/research_horizontal_list.dart
import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/research.dart';
import 'research_card.dart';

class ResearchHorizontalList extends StatelessWidget {
  final List<Research> researches;

  const ResearchHorizontalList({super.key, required this.researches});

  @override
  Widget build(BuildContext context) {
    if (researches.isEmpty) {
      return const Center(child: Text("No hay investigaciones disponibles"));
    }

    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: researches.length,
        itemBuilder: (context, index) {
          final research = researches[index];
          return ResearchCard(research: research);
        },
      ),
    );
  }
}
