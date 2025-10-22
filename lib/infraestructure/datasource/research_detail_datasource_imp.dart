import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_birds/domain/datasource/research_detail_datasource.dart';
import 'package:green_birds/domain/entities/research_detail.dart';
import 'package:green_birds/infraestructure/models/research_detail_model.dart';
import 'package:http/http.dart' as http;

class ResearchDetailDatasourceImp implements ResearchDetailDatasource {
  static String url = dotenv.env['API_BASE_URL']!;
  static String token = dotenv.env['TOKEN']!;
  @override
  Future<ResearchDetail> getResearchDetail(String researchId) async {
    final response = await http.get(
      Uri.parse('$url/details/research/$researchId'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final data = decoded['data'];

      final model = ResearchDetailModel.fromJson(data);
      return model.toResearchDetailEntity();
    } else {
      throw Exception(
        "Error al obtener detalle de investigación: ${response.statusCode}",
      );
    }
  }
}
