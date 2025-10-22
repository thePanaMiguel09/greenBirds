import 'package:green_birds/domain/entities/morphology_specie.dart';

class ObservedSpecie {
  final String specie;
  final int abundance;
  final String detection;
  final double distance;
  final int males;
  final int females;
  final int undeterminatedSex;
  final int numberAdults;
  final int juvenileCount;
  final String activity;
  final String substrate;
  final String stratum;
  final String observation;
  final MorphologySpecie morphology;
  final List<String> images;

  ObservedSpecie({
    required this.specie,
    required this.abundance,
    required this.detection,
    required this.distance,
    required this.males,
    required this.females,
    required this.undeterminatedSex,
    required this.numberAdults,
    required this.juvenileCount,
    required this.activity,
    required this.substrate,
    required this.stratum,
    required this.observation,
    required this.morphology,
    required this.images,
  });
}
