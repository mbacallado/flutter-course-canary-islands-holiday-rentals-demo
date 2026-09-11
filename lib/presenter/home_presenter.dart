import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/island.dart';
import 'package:viviendas_vacacionales/models/province.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';

class HomePresenter {
  late PageController pageController;
  late int selectedIndex;
  late List<ViviendaVacacional> viviendasVacacionales;

  late Province provinceTF;
  late Province provinceGC;

  HomePresenter(int index, this.viviendasVacacionales) {
    selectedIndex = index;
    pageController = PageController(initialPage: selectedIndex);
    provinceTF = Province();
    provinceGC = Province();
    setProvince(provinceTF, [
      'Tenerife',
      'La Palma',
      'La Gomera',
      'El Hierro',
    ], '38');
    setProvince(provinceGC, [
      'Gran Canaria',
      'Fuerteventura',
      'Lanzarote',
      'La Graciosa',
    ], '35');
  }

  void setProvince(Province province, List<String> names, String postcode) {
    province.addIsland(Island(names[0], filterByIsland(names[0])));
    province.addIsland(Island(names[1], filterByIsland(names[1])));
    province.addIsland(Island(names[2], filterByIsland(names[2])));
    province.addIsland(Island(names[3], filterByIsland(names[3])));
  }

  List<ViviendaVacacional> filterByPostcode(String postcode) {
    return viviendasVacacionales.where((element) {
      return element.postcode.startsWith(postcode);
    }).toList();
  }

  List<ViviendaVacacional> filterByIsland(String island) {
    return viviendasVacacionales.where((element) {
      return element.addressIslandName.startsWith(island);
    }).toList();
  }

  void onTap(int value) {
    selectedIndex = value;
    pageController.jumpToPage(selectedIndex);
  }
}
