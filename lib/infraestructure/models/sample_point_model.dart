import 'package:green_birds/domain/entities/sample_point.dart';
import 'package:green_birds/infraestructure/models/coordinate_model.dart';
import 'package:green_birds/infraestructure/models/sample_model.dart';

int _toInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? (double.tryParse(v)?.toInt() ?? 0);
  return 0;
}

double _toDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? 0.0;
  return 0.0;
}

DateTime _toDateTime(dynamic v) {
  if (v == null) return DateTime.fromMillisecondsSinceEpoch(0);
  if (v is DateTime) return v;
  if (v is int) return DateTime.fromMillisecondsSinceEpoch(v);
  if (v is String) {
    final parsed = DateTime.tryParse(v);
    return parsed ?? DateTime.fromMillisecondsSinceEpoch(0);
  }
  return DateTime.fromMillisecondsSinceEpoch(0);
}

class SamplePointModel {
  final String samplePointId;
  final int pointNumber;
  final CoordinateModel coordinates;
  final String samplingType;
  final String? detailSamplingType;
  final String detection;
  final String figure;
  final int censusPeriod;
  final int fixedRadius;
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

  factory SamplePointModel.fromJson(Map<String, dynamic> json) {
    final coords = CoordinateModel.fromJson(json['coordinates']);
    return SamplePointModel(
      samplePointId: json['_id']?.toString() ?? '',
      pointNumber: _toInt(json['pointNumber']),
      coordinates: coords,
      samplingType: json['samplingType']?.toString() ?? '',
      detailSamplingType: json['detailSamplingType']?.toString(),
      detection: json['detection']?.toString() ?? '',
      figure: json['figure']?.toString() ?? '',
      censusPeriod: _toInt(json['censusPeriod']),
      fixedRadius: _toInt(json['fixedRadius']),
      startDate: _toDateTime(json['startDate']),
      endDate: _toDateTime(json['endDate']),
      samples:
          (json['samples'] as List?)
              ?.map((smp) => SampleModel.fromJson(smp as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

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
