import 'package:green_birds/domain/entities/locality.dart';

class LocalityModel extends Locality {
  LocalityModel(
    super.id,
    super.name,
    super.village,
    super.neighborhood,
    super.city,
    super.country,
  );


  factory LocalityModel.fromJson(Map<String, dynamic> json) => LocalityModel(
    id: json['_id'], 
    name, 
    village, 
    neighborhood, 
    city, 
    country)

}
