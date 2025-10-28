import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:green_birds/presentation/providers/research_detail_provider.dart';
import 'package:green_birds/presentation/widgets/sampling_point_card.dart';

class DetailResearchScreen extends StatefulWidget {
  final String id;

  const DetailResearchScreen({super.key, required this.id});

  @override
  State<DetailResearchScreen> createState() => _DetailResearchScreenState();
}

class _DetailResearchScreenState extends State<DetailResearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final id = widget.id;
      context.read<ResearchDetailProvider>().loadResearchDetail(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle de Investigación',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const _ResearchDetailView(),
    );
  }
}

class _ResearchDetailView extends StatelessWidget {
  const _ResearchDetailView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ResearchDetailProvider>();
    const color = Color(0xFF26AD71);
    final mediaSize = MediaQuery.of(context).size;

    // ✅ Estado de carga
    if (provider.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: color, strokeWidth: 5),
            SizedBox(height: 16),
            Text('Cargando investigación...'),
          ],
        ),
      );
    }

    final detail = provider.currentResearchDetail;
    if (detail == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 128, color: color),
            const SizedBox(height: 16),
            const Text(
              'No se encontró la investigación',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Volver', style: TextStyle(color: color)),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 4,
              child: Container(
                width: mediaSize.width * 0.9,
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título y estado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            detail.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: color,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: detail.status == 'Ejecución'
                                ? color
                                : Colors.red,
                          ),
                          width: 12,
                          height: 12,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Descripción
                    if (detail.description != null &&
                        detail.description!.isNotEmpty)
                      Text(
                        detail.description!,
                        style: const TextStyle(fontSize: 14),
                      ),

                    const SizedBox(height: 8),
                    Text(
                      'ID: ${detail.id}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 16),

                    // Objetivos
                    if (detail.objectives.isNotEmpty) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.flag_outlined, color: color),
                          Text(
                            detail.objectives.join(', '),
                            style: const TextStyle(),
                          ),

                          const SizedBox(height: 12),
                        ],
                      ),
                    ],
                    // Resultados
                    if (detail.results.isNotEmpty) ...[
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            color: color,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Resultados',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...detail.results.map(
                        (res) => Padding(
                          padding: const EdgeInsets.only(left: 28, bottom: 4),
                          child: Text('• $res'),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Puntos de Muestreo
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.search_outlined, color: color),
                SizedBox(width: 8),
                Text(
                  'Puntos de Muestreo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          //Lista de puntos de muestreo
          // if (detail.samplePoints.isEmpty)
          //   const Padding(
          //     padding: EdgeInsets.all(20),
          //     child: Text('No hay puntos de muestreo registrados'),
          //   )
          // else
          //   ...detail.samplePoints.map(
          //     (point) => Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 16,
          //         vertical: 8,
          //       ),
          //       child: SamplingPointCard(
          //         samplePoint: point,
          //         researchId: detail.id,
          //       ),
          //     ),
          //   ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
