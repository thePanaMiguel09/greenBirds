import 'package:green_birds/domain/entities/morphology_specie.dart';

class MorphologyModel {
  final double billLenght;
  final int wingChord;
  final int tarsusLength;
  final int tailLength;
  final int totalLength;

  MorphologyModel({
    required this.billLenght,
    required this.wingChord,
    required this.tarsusLength,
    required this.tailLength,
    required this.totalLength,
  });

  factory MorphologyModel.fromJson(
    Map<String, dynamic> json, {
    required List<String> images,
  }) => MorphologyModel(
    billLenght: (json['billLength'] as num).toDouble(),
    wingChord: (json['wingChord'] as num).toInt(),
    tarsusLength: (json['tarsusLength'] as num).toInt(),
    tailLength: (json['tailLength'] as num).toInt(),
    totalLength: (json['totalLength'] as num).toInt(),
  );

  MorphologySpecie toMorphologyEntity() => MorphologySpecie(
    billLenght: billLenght,
    wingChord: wingChord,
    tarsusLength: tarsusLength,
    tailLength: tailLength,
    totalLength: totalLength,
  );
}
