import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/infraestructure/datasource/research_datasource_imp.dart';

class ResearchRepositoryImpl implements ResearchDatasourceImp {
  final ResearchDatasourceImp researchs;

  ResearchRepositoryImpl({required this.researchs});

  @override
  Future<List<Research>> getResearchs() {
    return researchs.getResearchs();
  }
}
