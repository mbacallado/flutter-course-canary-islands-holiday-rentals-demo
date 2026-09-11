import 'package:viviendas_vacacionales/repository/viviendas_vacacionales_repository.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';

class ViviendasVacacionalesPresenter {
  final ViviendasVacacionalesRepository _repository =
      ViviendasVacacionalesRepository();

  Future<List<ViviendaVacacional>> loadViviendasVacacionales() {
    return _repository.getViviendasVacacionales();
  }
}
