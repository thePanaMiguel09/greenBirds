import 'package:green_birds/domain/entities/locality.dart';

class LocalityModel {
  final String id;
  final String name;
  final String village;
  final String neighborhood;
  final String city;
  final String country;
  final String state;

  LocalityModel({
    required this.id,
    required this.name,
    required this.village,
    required this.neighborhood,
    required this.city,
    required this.country,
    required this.state,
  });

  factory LocalityModel.fromJson(Map<String, dynamic> json) => LocalityModel(
    id: json['_id']?.toString() ?? '',
    name: json['name'],
    village: json['village'],
    neighborhood: json['neighborhood'],
    city: json['city'],
    country: json['country'],
    state: json['state'],
  );

  Locality toLocalityEntity() => Locality(
    id: id,
    name: name,
    village: village,
    neighborhood: neighborhood,
    city: city,
    country: country,
    state: state,
  );
}
