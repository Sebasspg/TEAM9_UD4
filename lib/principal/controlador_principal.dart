import 'package:flutter/material.dart';
import 'package:team9_ud3_project/principal/menu.dart';
import 'package:team9_ud3_project/principal/panel.dart';
import 'package:team9_ud3_project/principal/perfil.dart';

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
          PanelPrincipal(),
          PerfilPrincipal(),
          // PerfilAntiwo()
        ],
      ),
    );
  }
}