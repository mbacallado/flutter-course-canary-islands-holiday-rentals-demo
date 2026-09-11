import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/widgets/vivienda_vacacional_card.dart';

class RawScreen extends StatelessWidget {
  RawScreen({
    super.key,
    required this.title,
    required this.viviendasVacacionales,
  });

  final String title;
  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (title.isNotEmpty) ? AppBar(title: Text(title)) : null,
      body: ListView.builder(
        itemCount: viviendasVacacionales.length,
        itemBuilder: (context, index) {
          final viviendaVacacional = viviendasVacacionales[index];
          return ViviendaVacacionalCard(viviendaVacacional: viviendaVacacional);
        },
      ),
    );
  }
}
