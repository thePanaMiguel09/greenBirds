import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/research_detail.dart';
import 'package:green_birds/domain/entities/sample.dart';
import 'package:green_birds/domain/entities/sample_point.dart';
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

  SamplePoint? getSamplePointById(String samplePointId) {
    if (currentResearchDetail == null) return null;
    try {
      return currentResearchDetail!.samplePoints.firstWhere(
        (point) => point.samplePointId == samplePointId,
      );
    } catch (e) {
      print('No se encontró el punto de muestreo con ID: $samplePointId');
      return null;
    }
  }

  Sample? getSampleById(String sampleId) {
    if (currentResearchDetail == null) return null;

    for (var point in currentResearchDetail!.samplePoints) {
      try {
        return point.samples.firstWhere(
          (sample) => sample.sampleId == sampleId,
        );
      } catch (e) {
        continue;
      }
    }
    return null;
  }
}
