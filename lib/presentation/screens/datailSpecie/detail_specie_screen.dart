import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_birds/domain/entities/morphology_specie.dart';
import 'package:provider/provider.dart';
import 'package:green_birds/presentation/providers/research_detail_provider.dart';

class DetailSpecieScreen extends StatelessWidget {
  final String specieId;

  const DetailSpecieScreen({super.key, required this.specieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Especie')),
      body: _DetailSpecieView(specieId: specieId),
    );
  }
}

class _DetailSpecieView extends StatelessWidget {
  final String specieId;

  const _DetailSpecieView({required this.specieId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ResearchDetailProvider>();
    const color = Color(0xFF26AD71);

    final specie = _findSpecieInAllSamples(provider, specieId);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (specie == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('No se encontró la especie: $specieId'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Volver'),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Galería de imágenes
            _ImageGallery(images: specie.images),

            const SizedBox(height: 16),

            // Nombre de la especie
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Especie',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    specie.specie,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Información General
            _InfoCard(
              title: 'Información General',
              icon: Icons.info_outline,
              children: [
                _InfoRow('Abundancia', '${specie.abundance} individuos'),
                _InfoRow('Detección', specie.detection),
                _InfoRow(
                  'Distancia',
                  '${specie.distance.toStringAsFixed(1)} metros',
                ),
                _InfoRow('Actividad', specie.activity),
                _InfoRow('Sustrato', specie.substrate),
                _InfoRow('Estrato', specie.stratum),
              ],
            ),

            // Información de Sexo y Edad
            _InfoCard(
              title: 'Sexo y Edad',
              icon: Icons.group_outlined,
              children: [
                _InfoRow('Machos', '${specie.males}'),
                _InfoRow('Hembras', '${specie.females}'),
                _InfoRow('Sexo indeterminado', '${specie.undeterminatedSex}'),
                _InfoRow('Adultos', '${specie.numberAdults}'),
                _InfoRow('Juveniles', '${specie.juvenileCount}'),
              ],
            ),

            // Información Morfológica
            _MorphologyCard(morphology: specie.morphology),

            // Observaciones
            if (specie.observation.isNotEmpty)
              _InfoCard(
                title: 'Observaciones',
                icon: Icons.notes,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      specie.observation,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper para buscar la especie en todas las muestras
  dynamic _findSpecieInAllSamples(provider, String specieName) {
    final detail = provider.currentResearchDetail;
    if (detail == null) return null;

    for (var point in detail.samplePoints) {
      for (var sample in point.samples) {
        for (var specie in sample.observedSpecies) {
          if (specie.specie == specieName) {
            return specie;
          }
        }
      }
    }
    return null;
  }
}

// Widget para galería de imágenes
class _ImageGallery extends StatefulWidget {
  final List<String> images;

  const _ImageGallery({required this.images});

  @override
  State<_ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<_ImageGallery> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: 300,
        color: Colors.grey[300],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
              SizedBox(height: 8),
              Text('No hay imágenes disponibles'),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 64,
                      color: Colors.grey,
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Indicador de posición
        if (widget.images.length > 1)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
        // Contador
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_currentIndex + 1}/${widget.images.length}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget para tarjetas de información
class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// Widget para fila de información
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// Widget para información morfológica
class _MorphologyCard extends StatelessWidget {
  final MorphologySpecie morphology;

  const _MorphologyCard({required this.morphology});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: color, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.straighten, color: color, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Información Morfológica',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _MorphologyItem(
                    label: 'Longitud del pico',
                    value: morphology.billLenght,
                    unit: 'mm',
                  ),
                  _MorphologyItem(
                    label: 'Acorde de ala',
                    value: morphology.wingChord,
                    unit: 'mm',
                  ),
                  _MorphologyItem(
                    label: 'Longitud del tarso',
                    value: morphology.tarsusLength,
                    unit: 'mm',
                  ),
                  _MorphologyItem(
                    label: 'Longitud de cola',
                    value: morphology.tailLength,
                    unit: 'mm',
                  ),
                  _MorphologyItem(
                    label: 'Longitud total',
                    value: morphology.totalLength,
                    unit: 'mm',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MorphologyItem extends StatelessWidget {
  final String label;
  final num value;
  final String unit;

  const _MorphologyItem({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            value > 0 ? '$value $unit' : 'N/D',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: value > 0 ? color : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
