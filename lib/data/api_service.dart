import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';

class ApiService {
  final String url =
      'https://datos.canarias.es/catalogos/general/dataset/9f4355a2-d086-4384-ba72-d8c99aa2d544/resource/2507a1c1-acf6-4c6a-a3cc-1d414849d1c5/download/establecimientos-extrahoteleros-de-tipologia-vivienda-vacacional-inscritos-en-el-registro-gener.json';

  Future<List<ViviendaVacacional>> fecthViviendasVacacionales() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['result'];
      return data
          .map<ViviendaVacacional>((json) => ViviendaVacacional.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load viviendas vacacionales');
    }
  }
}
