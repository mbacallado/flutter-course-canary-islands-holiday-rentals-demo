import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/province.dart';
import 'package:viviendas_vacacionales/screens/raw_screen.dart';

class ProvinceTabletScreen extends StatelessWidget {
  ProvinceTabletScreen({required this.title, required this.province});

  final String title;
  final Province province;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Row(
        children: [
          Expanded(
            child: RawScreen(
              title: province.islands[0].name,
              viviendasVacacionales: province.islands[0].viviendasVacacionales,
            ),
          ),
          Expanded(
            child: RawScreen(
              title: province.islands[1].name,
              viviendasVacacionales: province.islands[1].viviendasVacacionales,
            ),
          ),
          Expanded(
            child: RawScreen(
              title: province.islands[2].name,
              viviendasVacacionales: province.islands[2].viviendasVacacionales,
            ),
          ),
          Expanded(
            child: RawScreen(
              title: province.islands[3].name,
              viviendasVacacionales: province.islands[3].viviendasVacacionales,
            ),
          ),
        ],
      ),
    );
  }
}
