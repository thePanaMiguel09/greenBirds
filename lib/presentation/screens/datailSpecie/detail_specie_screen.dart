import 'package:flutter/material.dart';

class DetailSpecieScreen extends StatelessWidget {
  final String specieId;
  const DetailSpecieScreen({super.key, required this.specieId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Detalle de Especie $specieId')),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  width: 390,
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://media.istockphoto.com/id/1873605186/es/foto/un-p%C3%A1jaro-guacamaya-roja.jpg?s=612x612&w=0&k=20&c=AcvDAfsjERVcBiJpdPDW2Jml8wHfiSL2vZJdml18Lig=',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Especie',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Guacamaya Azul',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 390,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFF00AEEF),
                        width: 1,
                      ),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Información Morfológica',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 1.8,
                            children: const [
                              _InformationCard(
                                label: 'Longitud del pico',
                                value: 3,
                              ),
                              _InformationCard(
                                label: 'Acorde de ala',
                                value: 3,
                              ),
                              _InformationCard(
                                label: 'Longitud del torso',
                                value: 3,
                              ),
                              _InformationCard(
                                label: 'Longitud de cola',
                                value: 3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InformationCard extends StatelessWidget {
  final int value;
  final String label;

  const _InformationCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
