import 'package:green_birds/domain/entities/research_detail.dart';
import 'package:green_birds/domain/repositories/research_detail_repository.dart';
import 'package:green_birds/infraestructure/datasource/research_detail_datasource_imp.dart';

class ResearchDetailRepositoryImp implements ResearchDetailRepository {
  final ResearchDetailDatasourceImp researchDetail;

  ResearchDetailRepositoryImp({required this.researchDetail});

  @override
  Future<ResearchDetail> getResearchDetail(String researchId) {
    return researchDetail.getResearchDetail(researchId);
  }
}
