import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/screens/home_screen.dart';
import 'package:viviendas_vacacionales/screens/raw_screen.dart';
import 'package:viviendas_vacacionales/screens/splash_screen.dart';
import 'package:viviendas_vacacionales/utils/routes_tags.dart';

Map<String, Widget Function(BuildContext)> routesApp() {
  return <String, WidgetBuilder>{
    RouteTags.splash: (BuildContext context) => SplashScreen(),
    RouteTags.home: (BuildContext context) => HomeScreen(),
    RouteTags.raw: (BuildContext context) =>
        RawScreen(title: '', viviendasVacacionales: []),
  };
}
