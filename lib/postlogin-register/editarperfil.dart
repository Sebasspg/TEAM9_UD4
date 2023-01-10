import 'dart:async';

import 'package:flutter/material.dart';
import 'package:team9_ud3_project/postlogin-register/unmomento.dart';
import 'package:team9_ud3_project/principal/controlador_principal.dart';

class EditarPerfilInicial extends StatefulWidget {
  const EditarPerfilInicial({super.key});

  @override
  State<EditarPerfilInicial> createState() => _EditarPerfilInicialState();
}

class _EditarPerfilInicialState extends State<EditarPerfilInicial> {
  void unmomentotiempo() {
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ControladorPrincipal()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
            child: Text("CONTINUAR"),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnMomento()),
              );
              unmomentotiempo();
            })),
      ),
    );
  }
}
