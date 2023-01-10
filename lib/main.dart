import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/login/signin_page.dart';
import 'package:team9_ud3_project/login/signup_page.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:team9_ud3_project/principal/controlador_principal.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';
import 'package:team9_ud3_project/providers/receta_providers.dart';
import 'package:team9_ud3_project/providers/producto_provider.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:team9_ud3_project/providers/vacuna_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(const SplashScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
    //     overlays: [
    //       SystemUiOverlay.top,
    //     ]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductoProvider()),
          ChangeNotifierProvider(create: (_) => RecetaProvider()),
          ChangeNotifierProvider(create: (_) => AlergiaProvider()),
          ChangeNotifierProvider(create: (_) => LauncherProvider()),
          ChangeNotifierProvider(create: (_) => MedicinaProvider()),
          ChangeNotifierProvider(create: (_) => PesoProvider()),
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => UsuarioProvider()),
          ChangeNotifierProvider(create: (_) => VacunasProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gux Health',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: Preferences.token != '' ? '/simpleapp' : '/signin',
          routes: {
            '/signin': (context) => const SignInPage(),
            '/signup': (context) => const SignUpPage(),
            '/simpleapp': (context) => const ControladorPrincipal(),
          },
        ));
  }
}

//-SPLASH SCREEN :3-------
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splashIconSize: double.infinity,
          splash: Scaffold(
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/splashscreen/splashlogo.gif",
                          scale: 3.25,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/splashscreen/base.png",
                    scale: 4,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          duration: 3000,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          nextScreen: MyApp()),
    );
  }
}
