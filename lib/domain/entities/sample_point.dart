import 'package:green_birds/domain/entities/coordinate.dart';
import 'package:green_birds/domain/entities/sample.dart';

class SamplePoint {
  final String samplePointId;
  final int pointNumber;
  final Coordinate coordinates;
  final String samplingType;
  final String? detailSamplingType;
  final String detection;
  final String figure;
  final String censusPeriod;
  final String fixedRadius;
  final DateTime startDate;
  final DateTime endDate;
  final List<Sample> samples;

  SamplePoint({
    required this.samplePointId,
    required this.pointNumber,
    required this.coordinates,
    required this.samplingType,
    this.detailSamplingType,
    required this.detection,
    required this.figure,
    required this.censusPeriod,
    required this.fixedRadius,
    required this.startDate,
    required this.endDate,
    required this.samples,
  });
}
