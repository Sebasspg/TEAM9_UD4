import 'package:flutter/material.dart';
import 'package:team9_ud3_project/alergia/pages/alergia_productos/productalerg_pages.dart';

import 'pages/alergia_productos/alergycreate_pages.dart';


class MenupageAlergia extends StatefulWidget {
  const MenupageAlergia({super.key});

  @override
  State<MenupageAlergia> createState() => _MenupageAlergiaState();
}

class _MenupageAlergiaState extends State<MenupageAlergia> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductosAlergiaPage(),
    CreateAlergiaPage()
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
      ),);
    
  }
}
