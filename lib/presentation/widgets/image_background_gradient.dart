import 'package:flutter/material.dart';

class ImageBackgroung extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const ImageBackgroung({
    super.key,
    this.colors = const [Colors.transparent, Colors.black87],
    this.stops = const [0.0, 1.0],
  }) : assert(
         colors.length == stops.length,
         'Stops deben ser iguales al número de colores',
       );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: [0.0, 0.9],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
