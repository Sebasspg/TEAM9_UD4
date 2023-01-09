import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

class NosotrosPage extends StatefulWidget {
  const NosotrosPage({super.key});

  @override
  State<NosotrosPage> createState() => _NosotrosPageState();
}

class _NosotrosPageState extends State<NosotrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          NosotrosA(),
          NosotrosB(),
        ],
      ),
    );
  }
}

class NosotrosA extends StatefulWidget {
  const NosotrosA({super.key});

  @override
  State<NosotrosA> createState() => _NosotrosAState();
}

class _NosotrosAState extends State<NosotrosA> {
  @override
  Widget build(BuildContext context) {
    //--Colores :3--
    var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
    var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

    var colormediogris = const Color.fromARGB(255, 230, 231, 232);

    var nosotroslogo = 'assets/menuprincipal/otro/nosotroslogo.png';

    final redesProvider = Provider.of<LauncherProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  child: Image.asset(
                                      'assets/menuprincipal/bien/flecha_negra_volver.png'),
                                  onPressed: () {
                                    Navigator.pop(
                                      (context),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.046,
                            ),
                            Text(
                              "NOSOTROS",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/login/login_logo.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SOMOS",
                      style: GoogleFonts.quicksand(
                          fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.048,
                    ),
                    Image.asset(
                      'assets/menuprincipal/bien/appcube_logo.png',
                      width: MediaQuery.of(context).size.width * 0.426,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.044,
                    ),
                    Text(
                      "Una empresa dedicada a la educación, salud y bienestar humano.",
                      style: GoogleFonts.quicksand(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.065,
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colormediogris),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text(
                                    "UBICACIÓN",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/menuprincipal/bien/flecha_gris.png',
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.18,
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          onPressed: (() {
                            redesProvider.goMapLauncher();
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colormediogris),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text(
                                    "VISITA NUESTRA WEB",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/menuprincipal/bien/flecha_gris.png',
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.18,
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          onPressed: (() {
                            redesProvider.goBrowserLauncher();
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [colorbienceleste, colorbienverde])),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CONTÁCTANOS",
                                style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.025,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.mail,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Text(
                                            "E-MAIL",
                                            style: GoogleFonts.quicksand(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/menuprincipal/bien/flecha_gris.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.18,
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  onPressed: (() {
                                    redesProvider.goEmailLauncher();
                                  }),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.025,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.smartphone,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Text(
                                            "TELÉFONO / WHATSAPP",
                                            style: GoogleFonts.quicksand(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/menuprincipal/bien/flecha_gris.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.18,
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  onPressed: (() {
                                    redesProvider.goWahtsappLauncher();
                                  }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.025,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        "¡Desliza hacia arriba y echa un vistazo a otro de nuestros proyectos!",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.quicksand(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Image.asset(
                      'assets/menuprincipal/bien/gux_nosotros.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NosotrosB extends StatefulWidget {
  const NosotrosB({super.key});

  @override
  State<NosotrosB> createState() => _NosotrosBState();
}

class _NosotrosBState extends State<NosotrosB> {
  //--Colores :3--
  var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  child: Image.asset(
                                      'assets/menuprincipal/bien/flecha_negra_volver.png'),
                                  onPressed: () {
                                    Navigator.pop(
                                      (context),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.046,
                            ),
                            Text(
                              "NOSOTROS",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/login/login_logo.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                      // fit: BoxFit.fill,
                      // isAntiAlias: true,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Cookie",
              style: GoogleFonts.quicksand(
                  fontSize: 28, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            Image.asset(
              'assets/menuprincipal/bien/cookie.png',
              width: MediaQuery.of(context).size.width * 0.56,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Text(
              "Una app educativa para niños de",
              style: GoogleFonts.quicksand(
                  fontSize: 14.6, fontWeight: FontWeight.w500),
            ),
            Text(
              "2-4 años",
              style: GoogleFonts.quicksand(
                  fontSize: 14.6, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.09,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [colorbienceleste, colorbienverde])),
              child: Center(
                child: Text(
                  "DESCARGAR APK",
                  style: GoogleFonts.quicksand(
                      fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
