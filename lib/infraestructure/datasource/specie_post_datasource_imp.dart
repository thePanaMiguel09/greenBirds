import 'package:green_birds/domain/datasource/specie_datasource.dart';
import 'package:green_birds/domain/entities/specie_post.dart';
import 'package:green_birds/infraestructure/models/specie_model.dart';
import 'package:green_birds/shared/data/local_post_species_data.dart';

class SpeciePostDatasourceImp implements SpeciePostDatasource {
  @override
  Future<List<SpeciePost>> getPostSpecies() async {
    await Future.delayed(Duration(seconds: 1));

    final List<SpeciePost> speciePosts = speciesPostLocalData
        .map(
          (speciePost) =>
              SpeciePostModel.fromJson(speciePost).toSpeciePostEntity(),
        )
        .toList();

    return speciePosts;
  }
}
