import 'package:green_birds/domain/entities/observed_specie.dart';

class Sample {
  final String sampleId;
  final double temperature;
  final double relativeHumidity;
  final String presipitationState;
  final double cloudCoverage;
  final String luminosity;
  final String overallConditions;
  final List<ObservedSpecie> observedSpecies;

  Sample({
    required this.sampleId,
    required this.temperature,
    required this.relativeHumidity,
    required this.presipitationState,
    required this.cloudCoverage,
    required this.luminosity,
    required this.overallConditions,
    required this.observedSpecies,
  });
}
