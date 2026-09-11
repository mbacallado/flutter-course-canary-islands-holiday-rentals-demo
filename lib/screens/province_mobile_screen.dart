import 'package:flutter/material.dart';
import 'package:viviendas_vacacionales/models/province.dart';
import 'package:viviendas_vacacionales/screens/raw_screen.dart';

class ProvinceMobileScreen extends StatelessWidget {
  ProvinceMobileScreen({required this.title, required this.province});

  final String title;
  final Province province;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: TabBar(
              tabs: [
                Text(
                  province.islands[0].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  province.islands[1].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  province.islands[2].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  province.islands[3].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
              child: RawScreen(
                title: '',
                viviendasVacacionales:
                    province.islands[0].viviendasVacacionales,
              ),
            ),
            Expanded(
              child: RawScreen(
                title: '',
                viviendasVacacionales:
                    province.islands[1].viviendasVacacionales,
              ),
            ),
            Expanded(
              child: RawScreen(
                title: '',
                viviendasVacacionales:
                    province.islands[2].viviendasVacacionales,
              ),
            ),
            Expanded(
              child: RawScreen(
                title: '',
                viviendasVacacionales:
                    province.islands[3].viviendasVacacionales,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
