import 'package:green_birds/infraestructure/models/coordinate_model.dart';
import 'package:green_birds/infraestructure/models/locality_model.dart';
import 'package:green_birds/infraestructure/models/research_model.dart';
import 'package:green_birds/infraestructure/models/sample_point_model.dart';
import 'package:green_birds/domain/entities/research_detail.dart';

class ResearchDetailModel extends ResearchModel {
  final List<SamplePointModel> samplePoints;

  ResearchDetailModel({
    required this.samplePoints,
    required super.name,
    required super.id,
    super.description,
    required super.objectives,
    required super.results,
    super.startDate,
    super.endDate,
    required super.status,
    super.habitatType,
    super.domainVegetation,
    super.height,
    super.coordinates,
    super.locality,
  });

  factory ResearchDetailModel.fromJson(Map<String, dynamic> json) {
    return ResearchDetailModel(
      id: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      objectives:
          (json['objectives'] as List?)?.map((e) => e.toString()).toList() ??
          [],
      results:
          (json['results'] as List?)?.map((e) => e.toString()).toList() ?? [],
      startDate: json['startDate'] != null
          ? DateTime.tryParse(json['startDate'])
          : null,
      endDate: json['endDate'] != null
          ? DateTime.tryParse(json['endDate'])
          : null,
      status: json['status']?.toString() ?? '',
      habitatType: json['habitatType']?.toString(),
      domainVegetation:
          json['domainVegetation']?.toString() ??
          json['dominantVegetation']?.toString(),
      height: (json['height'] is num) ? (json['height'] as num).toInt() : null,
      coordinates: json['coordinates'] != null
          ? CoordinateModel.fromJson(json['coordinates'])
          : null,
      locality: json['locality'] != null
          ? LocalityModel.fromJson(json['locality'])
          : null,
      samplePoints:
          (json['samplingPoints'] as List?)
              ?.map((sp) => SamplePointModel.fromJson(sp))
              .toList() ??
          [],
    );
  }

  ResearchDetail toResearchDetailEntity() => ResearchDetail(
    id: id,
    name: name,
    description: description,
    objectives: objectives,
    results: results,
    startDate: startDate,
    endDate: endDate,
    status: status,
    habitatType: habitatType,
    domainVegetation: domainVegetation,
    height: height,
    coordinates: coordinates?.toCoordinateEntity(),
    locality: locality?.toLocalityEntity(),
    samplePoints: samplePoints.map((sp) => sp.toSamplePointEntity()).toList(),
  );
}
