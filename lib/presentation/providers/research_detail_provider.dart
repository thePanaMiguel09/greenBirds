import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/research_detail.dart';
import 'package:green_birds/infraestructure/repositories/research_detail_repository_imp.dart';

class ResearchDetailProvider extends ChangeNotifier {
  final ResearchDetailRepositoryImp researchDetailRepository;

  bool isLoading = false;
  ResearchDetail? currentResearchDetail;

  ResearchDetailProvider({required this.researchDetailRepository});

  Future<void> loadResearchDetail(String researchId) async {
    currentResearchDetail = null;
    isLoading = true;
    notifyListeners();
    try {
      final detail = await researchDetailRepository.getResearchDetail(
        researchId,
      );
      currentResearchDetail = detail;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      currentResearchDetail = null;
      notifyListeners();
    }
  }
}
