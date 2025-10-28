import 'package:green_birds/domain/entities/sample.dart';
import 'package:green_birds/infraestructure/models/observed_specie_model.dart';

double _toDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? 0.0;
  return 0.0;
}

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
    sampleId: json['_id']?.toString() ?? '',
    temperature: _toDouble(json['temperature']),
    relativeHumidity: _toDouble(json['relativeHumidity']),
    presipitationState: json['precipitationState']?.toString() ?? '',
    cloudCoverage: _toDouble(json['cloudCoverage']),
    luminosity: json['luminosity']?.toString() ?? '',
    overallConditions: json['overallConditions']?.toString() ?? '',
    observedSpecies:
        (json['observedSpecies'] as List?)
            ?.map(
              (specieJson) => ObservedSpecieModel.fromJson(
                specieJson as Map<String, dynamic>,
              ),
            )
            .toList() ??
        [],
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
