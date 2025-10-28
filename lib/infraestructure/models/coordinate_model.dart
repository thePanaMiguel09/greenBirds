import 'package:green_birds/domain/entities/coordinate.dart';

double _toDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? 0.0;
  return 0.0;
}

class CoordinateModel {
  final String id;
  final double latitude;
  final double longitude;

  CoordinateModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory CoordinateModel.fromJson(dynamic json) {
    if (json == null) {
      return CoordinateModel(id: '', latitude: 0.0, longitude: 0.0);
    }

    if (json is String) {
      return CoordinateModel(id: json, latitude: 0.0, longitude: 0.0);
    }

    final Map<String, dynamic> map = Map<String, dynamic>.from(json as Map);

    final id = map['_id']?.toString() ?? map['id']?.toString() ?? '';

    final latCandidates = [map['latitude'], map['lat'], map['y']];
    final lonCandidates = [map['longitude'], map['lon'], map['lng'], map['x']];

    double lat = 0.0;
    double lon = 0.0;
    for (final c in latCandidates) {
      if (c != null) {
        lat = _toDouble(c);
        break;
      }
    }
    for (final c in lonCandidates) {
      if (c != null) {
        lon = _toDouble(c);
        break;
      }
    }

    return CoordinateModel(id: id, latitude: lat, longitude: lon);
  }

  Coordinate toCoordinateEntity() =>
      Coordinate(id: id, latitude: latitude, longitude: longitude);
}
