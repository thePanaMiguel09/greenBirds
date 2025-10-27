import 'package:flutter/material.dart';
import 'package:green_birds/presentation/widgets/sampling_point_card.dart';

class DetailResearchScreen extends StatelessWidget {
  final String id;
  const DetailResearchScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle/Investigaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: _ResearchDetailView(id: id),
    );
  }
}

class _ResearchDetailView extends StatelessWidget {
  final String id;

  const _ResearchDetailView({required this.id});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    final mediaSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 4,
              child: Container(
                width: mediaSize.width * 0.9,
                height: mediaSize.height * 0.3,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Estudio de Biodiversidad Urbana',
                              style: TextStyle(
                                fontSize: 18,
                                color: color,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: color,
                              ),
                              width: 12,
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Investigación sobre aves en parques de la ciudad',
                          style: TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ID: $id', // Mostramos el ID
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(color: color, Icons.flag_outlined),
                          Text('Objetivo 1'),
                          Text('Objetivo 2'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(color: color, Icons.check_circle_outline),
                          Text('Resultado 1'),
                          Text('Resultado 2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.search_outlined, color: color),
                Text(
                  'Puntos de Muestreo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          ...List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SamplingPointCard(),
            ),
          ),
        ],
      ),
    );
  }
}
