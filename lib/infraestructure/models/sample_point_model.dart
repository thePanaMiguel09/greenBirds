import 'package:green_birds/domain/entities/sample_point.dart';
import 'package:green_birds/infraestructure/models/coordinate_model.dart';
import 'package:green_birds/infraestructure/models/sample_model.dart';

class SamplePointModel {
  final String samplePointId;
  final int pointNumber;
  final CoordinateModel coordinates;
  final String samplingType;
  final String? detailSamplingType;
  final String detection;
  final String figure;
  final String censusPeriod;
  final String fixedRadius;
  final DateTime startDate;
  final DateTime endDate;
  final List<SampleModel> samples;

  SamplePointModel({
    required this.samplePointId,
    required this.pointNumber,
    required this.coordinates,
    required this.samplingType,
    required this.detailSamplingType,
    required this.detection,
    required this.figure,
    required this.censusPeriod,
    required this.fixedRadius,
    required this.startDate,
    required this.endDate,
    required this.samples,
  });

  factory SamplePointModel.fromJson(Map<String, dynamic> json) =>
      SamplePointModel(
        samplePointId: json['_id']?.toString() ?? '',
        pointNumber: (json['pointNumber'] as num).toInt(),
        coordinates: CoordinateModel.fromJson(json['coordinates']),
        samplingType: json['samplingType'],
        detailSamplingType: json['detailSamplingType'],
        detection: json['detection'],
        figure: json['figure'],
        censusPeriod: json['censusPeriod'],
        fixedRadius: json['fixedRadius'],
        startDate: DateTime.tryParse(json['startDate'] ?? '')!,
        endDate: DateTime.tryParse(json['endDate'] ?? '')!,
        samples: (json['samples'] as List<dynamic>)
            .map((smp) => SampleModel.fromJson(smp as Map<String, dynamic>))
            .toList(),
      );

  SamplePoint toSamplePointEntity() => SamplePoint(
    samplePointId: samplePointId,
    pointNumber: pointNumber,
    coordinates: coordinates.toCoordinateEntity(),
    samplingType: samplingType,
    detection: detection,
    figure: figure,
    censusPeriod: censusPeriod,
    fixedRadius: fixedRadius,
    startDate: startDate,
    endDate: endDate,
    samples: samples.map((samp) => samp.toSampleEntity()).toList(),
  );
}
