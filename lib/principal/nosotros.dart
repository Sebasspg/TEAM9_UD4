import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {

    var nosotroslogo = 'assets/menuprincipal/otro/nosotroslogo.png';

    final redesProvider = Provider.of<LauncherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nosotros"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            child: Image.asset(nosotroslogo),
          ),
          const SizedBox(
              height: 15,
          ),
          SizedBox(
              child: Text(
            "AppCube",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
          )),
          const SizedBox(
              height: 10,
            ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.70,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 2.25 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Stack(children: [
                          InkWell(
                            onTap: () {
                              redesProvider.goMapLauncher();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: SizedBox(
                                  width: 100,
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2018/04/12/18/13/marker-3314279_960_720.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Ubicación',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Stack(children: [
                        InkWell(
                          onTap: () {
                            redesProvider.goEmailLauncher();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                'https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/33/ac/a9/33aca988-6a67-57c4-ec1e-b9f5d1e19969/logo_gmail_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-0-85-220-0.png/1200x630wa.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                'Correo',
                                style: GoogleFonts.quicksand(
                                    color:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(children: [
                        InkWell(
                          onTap: () {
                            redesProvider.goWahtsappLauncher();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                'https://assets.mofoprod.net/network/images/whatsapp_logo.original.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                'Telefono',
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(children: [
                        InkWell(
                          onTap: () {
                            redesProvider.goBrowserLauncher();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/6510/6510324.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                'Web',
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
