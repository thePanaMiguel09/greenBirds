import 'package:green_birds/domain/entities/specie_post.dart';

class SpeciePostModel {
  final String caption;
  final String imageURL;
  final String scientificName;
  final int observed;

  SpeciePostModel({
    required this.caption,
    required this.imageURL,
    required this.scientificName,
    required this.observed,
  });

  factory SpeciePostModel.fromJson(Map<String, dynamic> json) =>
      SpeciePostModel(
        caption: json["caption"],
        imageURL: json["imageURL"],
        scientificName: json["scientificName"],
        observed: json["observed"],
      );

  SpeciePost toSpeciePostEntity() => SpeciePost(
    caption: caption,
    imageURL: imageURL,
    scientificName: scientificName,
    observed: observed,
  );
}
