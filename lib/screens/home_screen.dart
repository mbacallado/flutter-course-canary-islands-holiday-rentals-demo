import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/screens/views/mobile_view.dart';
import 'package:viviendas_vacacionales/screens/views/tablet_view.dart';
import 'package:viviendas_vacacionales/screens/views/web_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viviendasVacacionales =
        ModalRoute.of(context)!.settings.arguments as List<ViviendaVacacional>;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return MobileView(viviendasVacacionales: viviendasVacacionales);
          } else if (constraints.maxWidth < 1100) {
            return TabletView(viviendasVacacionales: viviendasVacacionales);
          } else {
            return WebView(viviendasVacacionales: viviendasVacacionales);
          }
        },
      ),
    );
  }
}
