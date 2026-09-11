import 'package:viviendas_vacacionales/models/island.dart';

class Province {
  late final List<Island> islands;

  Province() {
    islands = [];
  }

  void addIsland(Island island) {
    islands.add(island);
  }
}
