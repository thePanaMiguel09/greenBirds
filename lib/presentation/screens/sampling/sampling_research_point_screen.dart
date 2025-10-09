import 'package:flutter/material.dart';
import 'package:green_birds/presentation/widgets/image_background_gradient.dart';

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
  const _DetailSamplingPointView();

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);
    final scrollPhysics = BouncingScrollPhysics();

    return SafeArea(
      child: SingleChildScrollView(
        physics: scrollPhysics,
        child: Padding(
          padding: const EdgeInsets.all(10),
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
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  _CharacteristicSampligPointCard(
                    icon: Icons.search_outlined,
                    title: 'Detalle',
                    label: 'Extensivo',
                  ),
                  _CharacteristicSampligPointCard(
                    icon: Icons.remove_red_eye_outlined,
                    title: 'Detección',
                    label: 'Visual',
                  ),
                  _CharacteristicSampligPointCard(
                    icon: Icons.circle_outlined,
                    title: 'Radio',
                    label: '50 metros',
                  ),
                  _CharacteristicSampligPointCard(
                    icon: Icons.watch_later_outlined,
                    title: 'Periodo',
                    label: '30 Días',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _ScheduleCard(color: color),
              const SizedBox(height: 20),
              _MapCard(),
              const SizedBox(height: 20),

              SizedBox(
                height: 200, // ajusta el alto que necesites
                child: ListView.builder(
                  physics: scrollPhysics,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _SampleCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: Image.network(
            'https://i.pinimg.com/736x/bd/22/1f/bd221fa72326054126cabac9dbc5236c.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //const color = Color(0xFF26AD71);

    return SizedBox(
      width: 300,
      height: 300,
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://media.istockphoto.com/id/1890631996/es/foto/loro-guacamayo-rojo-en-playa-del-carmen-m%C3%A9xico.jpg?s=612x612&w=0&k=20&c=yneAacEjp3cC5Oiw0M86o2UHODQWUHqNBXgz1jM64ZU=',
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      ImageBackgroung(),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          'Muestra 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.thermostat_outlined,
                          size: 32,
                          color: Colors.lightBlueAccent,
                        ),
                        Text('20°', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          size: 32,
                          color: Colors.lightBlueAccent,
                        ),
                        Text('Normal', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.cloud_outlined,
                          size: 32,
                          color: Colors.lightBlueAccent,
                        ),
                        Text('20°', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 32,
                          color: Colors.lightBlueAccent,
                        ),
                        Text('20°', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.cloud,
                          size: 32,
                          color: Colors.lightBlueAccent,
                        ),
                        Text('20°', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // TextButton.icon(
            //   style: TextButton.styleFrom(backgroundColor: color),
            //   onPressed: () {},
            //   label: Text('Ver Más', style: TextStyle(color: Colors.white)),
            //   icon: Icon(Icons.remove_red_eye_outlined, color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 100,
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: color),
                  SizedBox(width: 5),
                  Text(
                    'Cronograma',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Inicio: 31 de Julio de 2025',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Fin: 31 de Agosto de 2025',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
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
      width: 150,
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 5),
              child: Row(
                children: [
                  Icon(icon, color: color),
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
