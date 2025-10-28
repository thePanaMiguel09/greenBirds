import 'package:green_birds/domain/entities/morphology_specie.dart';

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

class MorphologyModel {
  final double billLength;
  final int wingChord;
  final int tarsusLength;
  final int tailLength;
  final int totalLength;

  final Map<String, dynamic>? bill;
  final Map<String, dynamic>? wings;
  final Map<String, dynamic>? legs;
  final Map<String, dynamic>? tail;

  MorphologyModel({
    required this.billLength,
    required this.wingChord,
    required this.tarsusLength,
    required this.tailLength,
    required this.totalLength,
    this.bill,
    this.wings,
    this.legs,
    this.tail,
  });

  factory MorphologyModel.fromJson(
    Map<String, dynamic>? json, {
    required List<String> images,
  }) {
    if (json == null) {
      return MorphologyModel(
        billLength: 0.0,
        wingChord: 0,
        tarsusLength: 0,
        tailLength: 0,
        totalLength: 0,
      );
    }

    final isSimpleFormat =
        json.containsKey('billLength') || json.containsKey('wingChord');

    if (isSimpleFormat) {
      return MorphologyModel(
        billLength: _toDouble(json['billLength']),
        wingChord: _toInt(json['wingChord']),
        tarsusLength: _toInt(json['tarsusLength']),
        tailLength: _toInt(json['tailLength']),
        totalLength: _toInt(json['totalLength']),
      );
    } else {
      return MorphologyModel(
        billLength: 0.0,
        wingChord: 0,
        tarsusLength: 0,
        tailLength: 0,
        totalLength: 0,
        bill: json['bill'] as Map<String, dynamic>?,
        wings: json['wings'] as Map<String, dynamic>?,
        legs: json['legs'] as Map<String, dynamic>?,
        tail: json['tail'] as Map<String, dynamic>?,
      );
    }
  }

  MorphologySpecie toMorphologyEntity() => MorphologySpecie(
    billLenght: billLength,
    wingChord: wingChord,
    tarsusLength: tarsusLength,
    tailLength: tailLength,
    totalLength: totalLength,
  );
}
