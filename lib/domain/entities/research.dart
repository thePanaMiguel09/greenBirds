import 'package:green_birds/domain/entities/coordinate.dart';
import 'package:green_birds/domain/entities/locality.dart';

class Research {
  final String name;
  final String? description;
  final List<String> objectives;
  final List<String> results;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status;
  final String? habitatType;
  final String? domainVegetation;
  final int? height;
  final Coordinate? coordinates;
  final Locality? locality;

  Research({
    required this.name,
    this.description,
    this.objectives = const [],
    this.results = const [],
    this.startDate,
    this.endDate,
    required this.status,
    this.habitatType,
    this.domainVegetation,
    this.height,
    this.coordinates,
    this.locality,
  });
}
