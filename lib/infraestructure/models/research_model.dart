import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/infraestructure/models/coordinate_model.dart';
import 'package:green_birds/infraestructure/models/locality_model.dart';

class ResearchModel {
  final String id;
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
  final CoordinateModel? coordinates;
  final LocalityModel? locality;

  ResearchModel({
    required this.id,
    required this.name,
    required this.description,
    required this.objectives,
    required this.results,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.habitatType,
    required this.domainVegetation,
    required this.height,
    required this.coordinates,
    required this.locality,
  });

  factory ResearchModel.fromJson(Map<String, dynamic> json) {
    DateTime? _tryParseDate(dynamic v) {
      if (v == null) return null;
      if (v is DateTime) return v;
      if (v is String) return DateTime.tryParse(v);
      return null;
    }

    return ResearchModel(
      id: json['uuid']?.toString() ?? json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      objectives:
          (json['objectives'] as List?)
              ?.map((obj) => obj.toString())
              .toList() ??
          [],
      results:
          (json['results'] as List?)?.map((res) => res.toString()).toList() ??
          [],
      startDate: _tryParseDate(json['startDate']),
      endDate: _tryParseDate(json['endDate']),
      status: json['status']?.toString() ?? '',
      habitatType: json['habitatType']?.toString(),
      domainVegetation:
          json['domainVegetation']?.toString() ??
          json['dominantVegetation']?.toString(),
      height: (json['height'] is num)
          ? (json['height'] as num).toInt()
          : (int.tryParse(json['height']?.toString() ?? '') ?? null),
      coordinates: json['coordinates'] != null
          ? CoordinateModel.fromJson(json['coordinates'])
          : null,
      locality: json['locality'] != null
          ? LocalityModel.fromJson(json['locality'])
          : null,
    );
  }

  Research toResearchEntity() => Research(
    id: id,
    name: name,
    status: status,
    description: description,
    objectives: objectives,
    results: results,
    startDate: startDate,
    endDate: endDate,
    habitatType: habitatType,
    domainVegetation: domainVegetation,
    height: height,
    coordinates: coordinates?.toCoordinateEntity(),
    locality: locality?.toLocalityEntity(),
  );
}
