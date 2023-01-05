import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({super.key});

  @override
  State<SimpleAppPage> createState() => _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("159753"),
      ),
      body: TextButton(
          onPressed: () {
            authService.cerrarSesion();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: const Text("Deslogearte")),
    );
  }
}
