import 'package:green_birds/domain/entities/coordinate.dart';

class CoordinateModel extends Coordinate {
  CoordinateModel({
    required super.id,
    required super.latitude,
    required super.longitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      CoordinateModel(
        id: json['_id'] ?? '',
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
      );
}
