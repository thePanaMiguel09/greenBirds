import 'package:green_birds/domain/entities/research.dart';

abstract class ResearchRepository {
  Future<List<Research>> getResearch();
}
