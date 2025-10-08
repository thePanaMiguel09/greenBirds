import 'package:flutter/material.dart';

class SamplingResearchPointScreen extends StatelessWidget {
  const SamplingResearchPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Punto de Muestreo')),
      body: const _DetailSamplingPointView(),
    );
  }
}

class _DetailSamplingPointView extends StatelessWidget {
  const _DetailSamplingPointView({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color,
                ),
                width: 80,
                height: 80,
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Punto de observación',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              _CharacteristicSampligPointCard(
                icon: Icons.remove_red_eye_rounded,
                title: 'Detalle',
                label: 'Extensivo',
              ),
              _CharacteristicSampligPointCard(
                icon: Icons.remove_red_eye_rounded,
                title: 'Detalle',
                label: 'Extensivo',
              ),
              _CharacteristicSampligPointCard(
                icon: Icons.remove_red_eye_rounded,
                title: 'Detalle',
                label: 'Extensivo',
              ),
              _CharacteristicSampligPointCard(
                icon: Icons.remove_red_eye_rounded,
                title: 'Detalle',
                label: 'Extensivo',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CharacteristicSampligPointCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String label;

  const _CharacteristicSampligPointCard({
    required this.icon,
    required this.title,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return SizedBox(
      height: 80,
      width: 190,
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.view_array_outlined, color: color),
                SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
