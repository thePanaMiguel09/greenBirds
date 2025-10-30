import 'package:green_birds/domain/entities/specie_post.dart';

class SpeciePostModel {
  final String capition;
  final String imageURL;
  final String scientificName;
  final int observed;

  SpeciePostModel({
    required this.capition,
    required this.imageURL,
    required this.scientificName,
    required this.observed,
  });

  factory SpeciePostModel.fromJson(Map<String, dynamic> json) =>
      SpeciePostModel(
        capition: json["capition"],
        imageURL: json["imageURL"],
        scientificName: json["scientificName"],
        observed: json["observed"],
      );

  SpeciePost toSpeciePostEntity() => SpeciePost(
    capition: capition,
    imageURL: imageURL,
    scientificName: scientificName,
    observed: observed,
  );
}
