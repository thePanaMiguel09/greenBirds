import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/specie_post.dart';
import 'package:green_birds/infraestructure/repositories/specie_post_repository_imp.dart';

class SpeciePostsProvider extends ChangeNotifier {
  final SpeciePostRepositoryImp speciePostRepositoryImp;

  bool isLoading = false;
  List<SpeciePost> speciePosts = [];

  SpeciePostsProvider({required this.speciePostRepositoryImp});

  Future<void> loadSpeciPosts() async {
    final speciePost = await speciePostRepositoryImp.getPostSpecies();
    speciePost.addAll(speciePost);
    isLoading = false;
    notifyListeners();
  }
}
