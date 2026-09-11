import 'package:viviendas_vacacionales/data/api_service.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';

class ViviendasVacacionalesRepository {
  final ApiService _apiService = ApiService();

  Future<List<ViviendaVacacional>> getViviendasVacacionales() {
    return _apiService.fecthViviendasVacacionales();
  }
}
