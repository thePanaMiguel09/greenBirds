import 'package:green_birds/domain/entities/locality.dart';

class LocalityModel {
  final String id;
  final String name;
  final String village;
  final String neighborhood;
  final String city;
  final String country;

  LocalityModel({
    required this.id,
    required this.name,
    required this.village,
    required this.neighborhood,
    required this.city,
    required this.country,
  });

  factory LocalityModel.fromJson(Map<String, dynamic> json) => LocalityModel(
    id: json['_id'],
    name: json['name'],
    village: json['village'],
    neighborhood: json['neighborhood'],
    city: json['city'],
    country: json['country'],
  );

  Locality toLocalityEntity() =>
      Locality(id, name, village, neighborhood, city, country);
}
