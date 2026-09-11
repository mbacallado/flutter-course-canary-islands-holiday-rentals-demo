import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/repository/viviendas_vacacionales_repository.dart';
import 'package:viviendas_vacacionales/utils/routes_tags.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final ViviendasVacacionalesRepository _repository =
      ViviendasVacacionalesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ViviendaVacacional>>(
        future: _repository.getViviendasVacacionales(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            final viviendasVacacionales = snapshot.data!;
            Future.delayed(Duration(seconds: 0), () {
              Navigator.pushReplacementNamed(
                context,
                RouteTags.home,
                arguments: viviendasVacacionales,
              );
            });
            return Center();
          }
        },
      ),
    );
  }
}
