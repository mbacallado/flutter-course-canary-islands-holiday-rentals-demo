import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/widgets/vivienda_vacacional_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, required this.viviendasVacacionales});

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchScreenPage(viviendasVacacionales: viviendasVacacionales),
    );
  }
}

class SearchScreenPage extends StatefulWidget {
  SearchScreenPage({super.key, required this.viviendasVacacionales});

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  State<SearchScreenPage> createState() => _SearchScreenPageState();
}

class _SearchScreenPageState extends State<SearchScreenPage> {
  String searchText = '';
  List<ViviendaVacacional> newList = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          SearchBar(
            hintText: 'Buscar por nombre...',
            leading: Icon(Icons.search),
            onChanged: (value) {
              setState(() {
                searchText = value;
                if (searchText != '') {
                  newList = widget.viviendasVacacionales.where((element) {
                    return element.establishmentTradeName
                        .toLowerCase()
                        .contains(searchText);
                  }).toList();
                } else {
                  newList.clear();
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: newList.length,
              itemBuilder: (context, index) {
                final viviendaVacacional = newList[index];
                return ViviendaVacacionalCard(
                  viviendaVacacional: viviendaVacacional,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
