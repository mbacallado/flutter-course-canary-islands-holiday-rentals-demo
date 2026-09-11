import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/vivienda_vacacional.dart';
import 'package:viviendas_vacacionales/presenter/home_presenter.dart';
import 'package:viviendas_vacacionales/screens/province_mobile_screen.dart';
import 'package:viviendas_vacacionales/screens/raw_screen.dart';
import 'package:viviendas_vacacionales/screens/search_screen.dart';
import 'package:viviendas_vacacionales/utils/utils.dart';

class MobileView extends StatelessWidget {
  MobileView({super.key, required this.viviendasVacacionales});

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return MobileViewPage(viviendasVacacionales: viviendasVacacionales);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MobileViewPage extends StatefulWidget {
  MobileViewPage({super.key, required this.viviendasVacacionales});
  List<String> names = ['Search', 'SC/TF', 'LP/GC', 'Unknown'];

  final List<ViviendaVacacional> viviendasVacacionales;

  @override
  State<StatefulWidget> createState() => _MobileViewPageState();
}

class _MobileViewPageState extends State<MobileViewPage> {
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
          SearchScreen(
            viviendasVacacionales: _homePresenter.viviendasVacacionales,
          ),
          ProvinceMobileScreen(
            title: widget.names[_homePresenter.selectedIndex],
            province: _homePresenter.provinceTF,
          ),
          ProvinceMobileScreen(
            title: widget.names[_homePresenter.selectedIndex],
            province: _homePresenter.provinceGC,
          ),
          RawScreen(
            title: widget.names[3],
            viviendasVacacionales: _homePresenter.filterByIsland('_U'),
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
            icon: Icon(Icons.search),
            label: widget.names[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: widget.names[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: widget.names[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: widget.names[3],
          ),
        ],
      ),
    );
  }
}
