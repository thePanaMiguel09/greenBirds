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

  factory LocalityModel.fromJson(dynamic json) {
    if (json == null) {
      return LocalityModel(
        id: '',
        name: '',
        village: '',
        neighborhood: '',
        city: '',
        country: '',
        state: '',
      );
    }

    final Map<String, dynamic> map = Map<String, dynamic>.from(json as Map);

    return LocalityModel(
      id: map['_id']?.toString() ?? map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      village: map['village']?.toString() ?? '',
      neighborhood: map['neighborhood']?.toString() ?? '',
      city: map['city']?.toString() ?? '',
      country: map['country']?.toString() ?? '',
      state: map['state']?.toString() ?? '',
    );
  }

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
