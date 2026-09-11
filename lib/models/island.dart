import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';

class Island {
  late final name;
  late final List<ViviendaVacacional> viviendasVacacionales;

  Island(String this.name, List<ViviendaVacacional> this.viviendasVacacionales);
}
