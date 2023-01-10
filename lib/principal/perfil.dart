import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/principal/nosotros.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';

class PerfilPrincipal extends StatefulWidget {
  const PerfilPrincipal({super.key});

  @override
  State<PerfilPrincipal> createState() => _PerfilPrincipalState();
}

class _PerfilPrincipalState extends State<PerfilPrincipal> {
  //--Colores :3--
  var colormediogris = const Color.fromARGB(255, 230, 231, 232);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MI PERFIL",
                        style: GoogleFonts.quicksand(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.448,
                    height: MediaQuery.of(context).size.width * 0.448,
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 230, 231, 232),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.448,
                    height: MediaQuery.of(context).size.width * 0.448,
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.width * 0.42,
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 210, 211, 213),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Text(
                "Nombre del Usuario",
                style: GoogleFonts.quicksand(
                    fontSize: 22.7, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CUENTA",
                        style: GoogleFonts.quicksand(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.18,
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
                                  Icons.edit,
                                  size: 18,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "Editar Perfil",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 15.2,
                                      fontWeight: FontWeight.w600),
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
                        onPressed: (() {}),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.red, width: 1.5),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cerrar Sesión",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15.2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                            const Icon(
                              Icons.logout,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.18,
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        onPressed: (() {
                          authService.cerrarSesion();
                          Navigator.pushNamed(context, '/signin');
                        }),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "APLICACIÓN",
                        style: GoogleFonts.quicksand(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.18,
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
                            Text(
                              "Nosotros",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15.2, fontWeight: FontWeight.w600),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NosotrosPage()),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.18,
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
                            Text(
                              "Versión de App",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15.2, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "1.0.0",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15.2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.18,
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        onPressed: (() {}),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}