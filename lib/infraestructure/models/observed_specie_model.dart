import 'package:green_birds/domain/entities/observed_specie.dart';
import 'package:green_birds/infraestructure/models/morphology_model.dart';

class ObservedSpecieModel {
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

  factory ObservedSpecieModel.fromJson(Map<String, dynamic> json) =>
      ObservedSpecieModel(
        specie: json['species'],
        abundance: (json['abundance'] as num).toInt(),
        detection: json['detection'],
        distance: (json['distance'] as num).toDouble(),
        males: (json['males'] as num).toInt(),
        females: (json['females'] as num).toInt(),
        undeterminatedSex: (json['undeterminatedSex'] as num).toInt(),
        numberAdults: (json['numberAdults'] as num).toInt(),
        juvenileCount: (json['juvenileCount'] as num).toInt(),
        activity: json['activity'],
        substrate: json['substrate'],
        stratum: json['stratum'],
        observation: json['observation'],
        morphology: MorphologyModel.fromJson(json['morphology'], images: []),
        images: (json['images'] as List<dynamic>)
            .map((img) => img.toString())
            .toList(),
      );

  ObservedSpecie toObservedSpecieEntity() => ObservedSpecie(
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
