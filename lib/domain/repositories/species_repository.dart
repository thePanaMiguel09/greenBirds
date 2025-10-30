import 'package:green_birds/domain/entities/specie_post.dart';

abstract class SpeciePostRepository {
  Future<List<SpeciePost>> getPostSpecies();
}
