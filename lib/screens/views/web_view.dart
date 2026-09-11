import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/presenter/home_presenter.dart';
import 'package:viviendas_vacacionales/screens/province_tablet_screen.dart';

class WebView extends StatelessWidget {
  WebView({super.key, required this.viviendasVacacionales});

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return WebViewPage(viviendasVacacionales: viviendasVacacionales);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class WebViewPage extends StatefulWidget {
  WebViewPage({super.key, required this.viviendasVacacionales});
  List<String> names = [
    'Provincia: Santa Cruz de Tenerife',
    ' Provincia: Las Palmas de Gran Canaria',
  ];

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late HomePresenter _homePresenter;

  @override
  void initState() {
    super.initState();
    setState(() {
      _homePresenter = HomePresenter(0, widget.viviendasVacacionales);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ProvinceTabletScreen(
              title: widget.names[0],
              province: _homePresenter.provinceTF,
            ),
          ),
          Expanded(
            child: ProvinceTabletScreen(
              title: widget.names[1],
              province: _homePresenter.provinceGC,
            ),
          ),
        ],
      ),
    );
  }
}
