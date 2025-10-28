import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/research_detail.dart';
import 'package:green_birds/domain/repositories/research_detail_repository.dart';

class ResearchDetailProvider extends ChangeNotifier {
  final ResearchDetailRepository researchDetailRepository;

  bool isLoading = false;
  String? errorMessage;
  ResearchDetail? currentResearchDetail;

  ResearchDetailProvider({required this.researchDetailRepository});

  Future<void> loadResearchDetail(String researchId) async {
    isLoading = true;
    errorMessage = null;
    currentResearchDetail = null;
    notifyListeners();

    try {
      final detail = await researchDetailRepository.getResearchDetail(
        researchId,
      );
      currentResearchDetail = detail;
    } catch (e) {
      errorMessage = "Error al cargar el detalle: $e";
      debugPrint(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
