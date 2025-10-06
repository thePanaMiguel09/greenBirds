import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_birds/domain/datasource/research_datasource.dart';
import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/infraestructure/models/research_model.dart';
import 'package:http/http.dart' as http;

class ResearchDatasourceImp implements ResearchDatasource {
  final String url = dotenv.env['API_BASE_URL']!;
  final String token = dotenv.env['TOKEN']!;

  Map<String, String> get headers => {
    "Content-Type": "application/json",
    'Authorization': "Bearer $token",
  };

  @override
  Future<List<Research>> getResearchs() async {
    final response = await http.get(
      Uri.parse('$url/research'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List<dynamic> data = decoded['data'];

      return data
          .map((json) => ResearchModel.fromJson(json).toResearchEntity())
          .toList();
    } else {
      throw Exception(
        "Error al obtener investigaciones: ${response.statusCode}",
      );
    }
  }
}
