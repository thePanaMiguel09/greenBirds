import 'package:flutter/material.dart';
import 'package:green_birds/presentation/providers/researchs_provider.dart';
import 'package:green_birds/presentation/widgets/researchs_scroll.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final researchProvier = context.watch<ResearchsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investigaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: researchProvier.initLoading
          ? Text('Cargando')
          : Column(
              children: [
                ResearchHorizontalList(researches: researchProvier.researchs),
                SizedBox(height: 20),
                _StatisticsView(),
              ],
            ),
    );
  }
}

class _StatisticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Estadísticas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('70%'),
                Text(
                  'Investigaciones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Activas',
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('30%'),
                Text(
                  'Investigaciones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Inactivas',
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
