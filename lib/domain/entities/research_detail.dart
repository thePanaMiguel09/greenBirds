import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/domain/entities/sample_point.dart';

class ResearchDetail extends Research {
  final List<SamplePoint> samplePoints;

  ResearchDetail({
    required this.samplePoints,
    required super.name,
    super.description,
    super.objectives,
    super.results,
    super.startDate,
    super.endDate,
    required super.status,
    super.habitatType,
    super.domainVegetation,
    super.height,
    super.coordinates,
    super.locality,
  });
}
