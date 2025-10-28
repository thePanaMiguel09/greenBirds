import 'package:green_birds/domain/entities/observed_specie.dart';
import 'package:green_birds/infraestructure/models/morphology_model.dart';

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

class ObservedSpecieModel {
  final String id;
  final String specie;
  final int abundance;
  final String detection;
  final double distance;
  final int males;
  final int females;
  final int undeterminatedSex;
  final int numberAdults;
  final int juvenileCount;
  final String activity;
  final String substrate;
  final String stratum;
  final String observation;
  final MorphologyModel morphology;
  final List<String> images;

  ObservedSpecieModel({
    required this.id,
    required this.specie,
    required this.abundance,
    required this.detection,
    required this.distance,
    required this.males,
    required this.females,
    required this.undeterminatedSex,
    required this.numberAdults,
    required this.juvenileCount,
    required this.activity,
    required this.substrate,
    required this.stratum,
    required this.observation,
    required this.morphology,
    required this.images,
  });

  factory ObservedSpecieModel.fromJson(Map<String, dynamic> json) {
    final List<String> images =
        (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return ObservedSpecieModel(
      id: json['_id']?.toString() ?? '',
      specie: json['species']?.toString() ?? '',
      abundance: _toInt(json['abundance']),
      detection: json['detection']?.toString() ?? '',
      distance: _toDouble(json['distance']),
      males: _toInt(json['males']),
      females: _toInt(json['females']),
      undeterminatedSex: _toInt(json['undeterminatedSex']),
      numberAdults: _toInt(json['numberAdults']),
      juvenileCount: _toInt(json['juvenileCount']),
      activity: json['activity']?.toString() ?? '',
      substrate: json['substrate']?.toString() ?? '',
      stratum: json['stratum']?.toString() ?? '',
      observation: json['observation']?.toString() ?? '',
      morphology: MorphologyModel.fromJson(
        (json['morphology'] is Map)
            ? Map<String, dynamic>.from(json['morphology'])
            : null,
        images: images,
      ),
      images: images,
    );
  }

  ObservedSpecie toObservedSpecieEntity() => ObservedSpecie(
    id: id,
    specie: specie,
    abundance: abundance,
    detection: detection,
    distance: distance,
    males: males,
    females: females,
    undeterminatedSex: undeterminatedSex,
    numberAdults: numberAdults,
    juvenileCount: juvenileCount,
    activity: activity,
    substrate: substrate,
    stratum: stratum,
    observation: observation,
    morphology: morphology.toMorphologyEntity(),
    images: images,
  );
}
