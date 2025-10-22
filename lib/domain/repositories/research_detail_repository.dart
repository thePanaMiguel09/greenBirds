import 'package:green_birds/domain/entities/research_detail.dart';

abstract class ResearchDetailRepository {
  Future<ResearchDetail> getResearchDetail(String researchId);
}
