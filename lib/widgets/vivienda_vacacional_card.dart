import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/utils/utils.dart';

class ViviendaVacacionalCard extends StatelessWidget {
  const ViviendaVacacionalCard({super.key, required this.viviendaVacacional});

  final ViviendaVacacional viviendaVacacional;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAlertDialog(
          context,
          viviendaVacacional.establishmentTradeName,
          'Longitud: ${viviendaVacacional.longitude}\nLatitud: ${viviendaVacacional.latitude}',
        );
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 5, top: 5),
          child: Column(
            children: [
              Text(
                viviendaVacacional.establishmentTradeName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text('Código póstal: ${viviendaVacacional.postcode}'),
              Text('Provincia: ${viviendaVacacional.addressProvinceName}'),
              Text('Municipio: ${viviendaVacacional.addressMunicipalityName}'),
              Text('Isla: ${viviendaVacacional.addressIslandName}'),
            ],
          ),
        ),
      ),
    );
  }
}
