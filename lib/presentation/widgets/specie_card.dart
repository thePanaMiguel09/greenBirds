import 'package:flutter/material.dart';

class SpecieCard extends StatelessWidget {
  const SpecieCard({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return SizedBox(
      width: 390,
      height: 150,
      child: Card(
        elevation: 3,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://media.istockphoto.com/id/1890631996/es/foto/loro-guacamayo-rojo-en-playa-del-carmen-m%C3%A9xico.jpg?s=612x612&w=0&k=20&c=yneAacEjp3cC5Oiw0M86o2UHODQWUHqNBXgz1jM64ZU=',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Especie'),
                      Text(
                        'Cardianlis Cardinalis',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        spacing: 20,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cantidad'),
                              Text(
                                '5',
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Distancia'),
                              Text(
                                '10.5m',
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
