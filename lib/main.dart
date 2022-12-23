import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
          home: const SplashScreen(),
        ));
  }
}

//======================Splash scren flutter============================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => ControladorPrincipal())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.lightBlue, Colors.green]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_vc2wqkee.json'),
            Text(
              '',
              style: GoogleFonts.montserrat(fontSize: 50, color: Colors.white),
            ),
            SizedBox(
              height: 90,
            ),
            SpinKitChasingDots(
              color: Colors.white,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
