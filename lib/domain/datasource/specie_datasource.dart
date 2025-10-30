import 'package:green_birds/domain/entities/specie_post.dart';

abstract class SpeciePostDatasource {
  Future<List<SpeciePost>> getPostSpecies();
}
