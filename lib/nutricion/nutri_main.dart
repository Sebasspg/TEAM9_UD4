import 'package:flutter/material.dart';
import 'package:team9_ud3_project/nutricion/alert_gux.dart';
import 'package:team9_ud3_project/nutricion/grafico_peso.dart';
import 'package:team9_ud3_project/nutricion/nutripeso_home.dart';

class NutriMain extends StatelessWidget {
  NutriMain({super.key});

  final PageController controllerPage = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controllerPage,
        children: const [
          GraficoPage(),
          NutriPage(),
          AlertPage(),
        ],
      ),
    );
  }
}
