import 'package:flutter/material.dart';
import 'package:team9_ud3_project/principal/b_informes.dart';
import 'package:team9_ud3_project/principal/a_menu.dart';
import 'package:team9_ud3_project/principal/c_perfil.dart';

class ControladorPrincipal extends StatefulWidget {
  const ControladorPrincipal({super.key});

  @override
  State<ControladorPrincipal> createState() => _ControladorPrincipalState();
}

class _ControladorPrincipalState extends State<ControladorPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          MenuPrincipal(),
          Informes(),
          Perfil(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Center(
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'A'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'B'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'C'),
            ],
          ),
        ),
      ),
    );
  }
}