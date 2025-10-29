import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/observed_specie.dart';

class SpecieCard extends StatelessWidget {
  final ObservedSpecie specie;
  final VoidCallback onTap;
  const SpecieCard({super.key, required this.specie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen de la especie
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: specie.images.isNotEmpty
                          ? Image.network(
                              specie.images.first,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                    const SizedBox(width: 16),

                    // Información de la especie
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Especie',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            specie.specie,
                            style: const TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),

                          // Datos numéricos
                          Row(
                            children: [
                              Expanded(
                                child: _DataChip(
                                  label: 'Abundancia',
                                  value: '${specie.abundance}',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _DataChip(
                                  label: 'Distancia',
                                  value:
                                      '${specie.distance.toStringAsFixed(1)}m',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Sexo
                          Row(
                            children: [
                              Expanded(
                                child: _DataChip(
                                  label: 'Machos',
                                  value: '${specie.males}',
                                  icon: Icons.male,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _DataChip(
                                  label: 'Hembras',
                                  value: '${specie.females}',
                                  icon: Icons.female,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Botón de detección
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Chip(
                      backgroundColor: color,
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getDetectionIcon(specie.detection),
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            specie.detection,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getDetectionIcon(String detection) {
    if (detection.toLowerCase().contains('visual')) {
      return Icons.remove_red_eye_outlined;
    } else if (detection.toLowerCase().contains('red') ||
        detection.toLowerCase().contains('captura')) {
      return Icons.catching_pokemon;
    } else if (detection.toLowerCase().contains('audio') ||
        detection.toLowerCase().contains('canto')) {
      return Icons.hearing;
    }
    return Icons.sensors;
  }
}

class _DataChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const _DataChip({required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 12, color: Colors.grey[600]),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26AD71),
            ),
          ),
        ],
      ),
    );
  }
}
