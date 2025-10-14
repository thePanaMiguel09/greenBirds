import 'package:green_birds/domain/entities/coordinate.dart';

class CoordinateModel {
  final String id;
  final double latitude;
  final double longitude;

  CoordinateModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      CoordinateModel(
        id: json['_id'] ?? '',
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
      );

  Coordinate toCoordinateEntity() =>
      Coordinate(id: id, latitude: latitude, longitude: longitude);
}
