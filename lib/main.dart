import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/principal/controlador_principal.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';
import 'package:team9_ud3_project/providers/receta_providers.dart';
import 'package:team9_ud3_project/providers/producto_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [
          SystemUiOverlay.top,
        ]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductoProvider()),
          ChangeNotifierProvider(create: (_) => RecetaProvider()),
          ChangeNotifierProvider(create: (_) => AlergiaProvider()),
          ChangeNotifierProvider(create: (_) => LauncherProvider()),
          ChangeNotifierProvider(create: (_) => MedicinaProvider()),
          ChangeNotifierProvider(create: (_) => PesoProvider()),
        ],
        child: MaterialApp(
          color: Colors.blue,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          home: const ControladorPrincipal(),
        ));
  }
}
