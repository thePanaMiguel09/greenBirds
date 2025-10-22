import 'package:green_birds/domain/entities/sample.dart';
import 'package:green_birds/infraestructure/models/observed_specie_model.dart';

class SampleModel {
  final String sampleId;
  final double temperature;
  final double relativeHumidity;
  final String presipitationState;
  final double cloudCoverage;
  final String luminosity;
  final String overallConditions;
  final List<ObservedSpecieModel> observedSpecies;

  SampleModel({
    required this.sampleId,
    required this.temperature,
    required this.relativeHumidity,
    required this.presipitationState,
    required this.cloudCoverage,
    required this.luminosity,
    required this.overallConditions,
    required this.observedSpecies,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
    sampleId: json['_id'],
    temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
    relativeHumidity: (json['relativeHumidity'] as num?)?.toDouble() ?? 0,
    presipitationState: json['precipitationState'] ?? '',
    cloudCoverage: (json['cloudCoverage'] as num?)?.toDouble() ?? 0,
    luminosity: json['luminosity'],
    overallConditions: json['overallConditions'],
    observedSpecies: (json['observedSpecies'] as List<dynamic>)
        .map(
          (specieJson) =>
              ObservedSpecieModel.fromJson(specieJson as Map<String, dynamic>),
        )
        .toList(),
  );

  Sample toSampleEntity() => Sample(
    sampleId: sampleId,
    temperature: temperature,
    relativeHumidity: relativeHumidity,
    presipitationState: presipitationState,
    cloudCoverage: cloudCoverage,
    luminosity: luminosity,
    overallConditions: overallConditions,
    observedSpecies: observedSpecies
        .map((specie) => specie.toObservedSpecieEntity())
        .toList(),
  );
}
