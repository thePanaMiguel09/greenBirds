import 'package:fl_chart/fl_chart.dart';
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
    final researchProvier = context.watch<ResearchsProvider>();
    const color = Color(0xFF26AD71);

    final total = researchProvier.researchs.length;
    final active = researchProvier.researchs
        .where((r) => r.status == "Ejecución")
        .length;
    final inactive = total - active;
    final activePercent = total > 0
        ? (active * 100 / total).toStringAsFixed(1)
        : "0";
    final inactivePercent = total > 0
        ? (inactive * 100 / total).toStringAsFixed(1)
        : "0";

    if (total == 0) {
      return const Center(
        child: Text("No hay investigaciones para estadísticas"),
      );
    }

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
                Text('$activePercent%'),
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
                Text('$inactivePercent%'),
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
        SizedBox(height: 20),
        _StatisticsResearchs(
          active: active.toDouble(),
          inactive: inactive.toDouble(),
        ),
      ],
    );
  }
}

class _StatisticsResearchs extends StatelessWidget {
  final double active;
  final double inactive;

  const _StatisticsResearchs({required this.active, required this.inactive});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: active.toDouble(),
              color: color,
              radius: 25,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              value: inactive.toDouble(),
              color: Colors.red,
              radius: 25,
              titleStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
