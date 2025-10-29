import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_birds/domain/entities/sample.dart';
import 'package:provider/provider.dart';
import 'package:green_birds/presentation/providers/research_detail_provider.dart';
import 'package:green_birds/presentation/widgets/specie_card.dart';

class SamplingSpeciesScreen extends StatelessWidget {
  final String sampleId;

  const SamplingSpeciesScreen({super.key, required this.sampleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Especies Observadas')),
      body: _SamplingSpeciesView(sampleId: sampleId),
    );
  }
}

class _SamplingSpeciesView extends StatelessWidget {
  final String sampleId;

  const _SamplingSpeciesView({required this.sampleId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ResearchDetailProvider>();

    final sample = provider.getSampleById(sampleId);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (sample == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No se encontró la muestra'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Volver'),
            ),
          ],
        ),
      );
    }

    final observedSpecies = sample.observedSpecies;

    return Column(
      children: [
        _SampleInfoCard(sample: sample),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.pets, color: Color(0xFF26AD71)),
              const SizedBox(width: 8),
              Text(
                'Especies Observadas (${observedSpecies.length})',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Lista de especies
        Expanded(
          child: observedSpecies.isEmpty
              ? const Center(
                  child: Text('No hay especies observadas en esta muestra'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: observedSpecies.length,
                  itemBuilder: (context, index) {
                    final specie = observedSpecies[index];
                    return SpecieCard(
                      specie: specie,
                      onTap: () {
                        // Navegar al detalle de la especie
                        // Puedes pasar el nombre o crear un ID único
                        context.push('/species/${specie.specie}');
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _SampleInfoCard extends StatelessWidget {
  final Sample sample;

  const _SampleInfoCard({required this.sample});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información de la Muestra',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(
                  icon: Icons.thermostat_outlined,
                  label: 'Temperatura',
                  value: '${sample.temperature}°C',
                ),
                _InfoItem(
                  icon: Icons.water_drop_outlined,
                  label: 'Humedad',
                  value: '${sample.relativeHumidity}%',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(
                  icon: Icons.cloud_outlined,
                  label: 'Nubosidad',
                  value: '${sample.cloudCoverage}%',
                ),
                _InfoItem(
                  icon: Icons.wb_sunny_outlined,
                  label: 'Luminosidad',
                  value: sample.luminosity,
                ),
              ],
            ),
            const SizedBox(height: 8),
            _InfoItem(
              icon: Icons.check_circle_outline,
              label: 'Condiciones',
              value: sample.overallConditions,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.lightBlueAccent),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
