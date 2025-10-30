import 'package:green_birds/domain/entities/specie_post.dart';
import 'package:green_birds/domain/repositories/species_repository.dart';
import 'package:green_birds/infraestructure/datasource/specie_post_datasource_imp.dart';

class SpeciePostRepositoryImp implements SpeciePostRepository {
  final SpeciePostDatasourceImp speciePosts;

  SpeciePostRepositoryImp({required this.speciePosts});

  @override
  Future<List<SpeciePost>> getPostSpecies() {
    return speciePosts.getPostSpecies();
  }
}
