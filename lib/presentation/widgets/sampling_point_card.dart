import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/sample_point.dart';
import 'package:green_birds/presentation/widgets/custom_chip.dart';

class SamplingPointCard extends StatelessWidget {
  final SamplePoint samplePoint;
  final String researchId;
  const SamplingPointCard({
    super.key,
    required this.samplePoint,
    required this.researchId,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://i.pinimg.com/736x/bd/22/1f/bd221fa72326054126cabac9dbc5236c.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Punto de Captura',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomChip(
                        icon: Icons.access_time_rounded,
                        label: '30 Días',
                      ),
                      SizedBox(width: 5),
                      CustomChip(
                        icon: Icons.circle_outlined,
                        label: '50 metros',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
