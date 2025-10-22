import 'package:green_birds/domain/entities/research_detail.dart';

abstract class ResearchDetailDatasource {
  Future<ResearchDetail> getResearchDetail(String researchId);
}
