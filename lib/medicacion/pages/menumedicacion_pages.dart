import 'package:flutter/material.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/PMedicacion_pages.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/crearmedicacion_pages.dart';


class MenupageMedicina extends StatefulWidget {
  const MenupageMedicina({super.key});

  @override
  State<MenupageMedicina> createState() => _MenupageMedicinaState();
}

class _MenupageMedicinaState extends State<MenupageMedicina> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductosMedicinaPage(),
    CreateMedicinaPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
    );
  }
}
