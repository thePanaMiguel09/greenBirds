import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/infraestructure/repositories/research_repository_impl.dart';

class ResearchsProvider extends ChangeNotifier {
  final ResearchRepositoryImpl researchRepository;

  bool initLoading = true;
  List<Research> researchs = [];

  ResearchsProvider({required this.researchRepository});

  Future<void> loadResearchs() async {
    final researchs = await researchRepository.getResearchs();
    researchs.addAll(researchs);
    initLoading = false;
    notifyListeners();
  }
}
