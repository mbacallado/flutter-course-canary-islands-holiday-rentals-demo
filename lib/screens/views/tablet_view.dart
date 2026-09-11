import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/presenter/home_presenter.dart';
import 'package:viviendas_vacacionales/screens/province_tablet_screen.dart';
import 'package:viviendas_vacacionales/utils/utils.dart';

class TabletView extends StatelessWidget {
  TabletView({super.key, required this.viviendasVacacionales});

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return TabletViewPage(viviendasVacacionales: viviendasVacacionales);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class TabletViewPage extends StatefulWidget {
  TabletViewPage({super.key, required this.viviendasVacacionales});
  List<String> names = [
    'Provincia: Santa Cruz de Tenerife',
    ' Provincia: Las Palmas de Gran Canaria',
  ];

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  State<StatefulWidget> createState() => _TabletViewPageState();
}

class _TabletViewPageState extends State<TabletViewPage> {
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
      body: PageView(
        controller: _homePresenter.pageController,
        children: [
          ProvinceTabletScreen(
            title: widget.names[_homePresenter.selectedIndex],
            province: _homePresenter.provinceTF,
          ),
          ProvinceTabletScreen(
            title: widget.names[_homePresenter.selectedIndex],
            province: _homePresenter.provinceGC,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _homePresenter.selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            _homePresenter.onTap(value);
            showSnackBar(context, widget.names[_homePresenter.selectedIndex]);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: widget.names[0].split(':')[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: widget.names[1].split(':')[1],
          ),
        ],
      ),
    );
  }
}
