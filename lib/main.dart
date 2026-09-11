import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/routes.dart';
import 'package:viviendas_vacacionales/utils/app_theme.dart';
import 'package:viviendas_vacacionales/utils/routes_tags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viviendas Vacacionales - Canarias',
      theme: appTheme(),
      initialRoute: RouteTags.splash,
      routes: routesApp(),
    );
  }
}
