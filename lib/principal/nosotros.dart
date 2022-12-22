import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/launcher_provider.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final redesProvider = Provider.of<LauncherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nosotros"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            child: Image.network(
                "https://cdn.pixabay.com/photo/2016/03/28/12/35/cat-1285634_960_720.png"),
          ),
          SizedBox(
              child: Text(
            "AppCube",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          )),
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
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: SizedBox(
                                  width: 100,
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2018/05/30/15/31/globe-3441673_960_720.jpg',
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
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Ubicacion',
                                  style: GoogleFonts.montserrat(
                                      color: const Color.fromARGB(
                                          255, 22, 73, 114),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
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
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                'https://www.mundodeportivo.com/urbantecno/hero/2022/07/Descubre-los-mejores-trucos-para-dominar-Gmail.jpg?width=1200&aspect_ratio=16:9',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                              child: Text(
                                'Correo',
                                style: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
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
                            borderRadius: BorderRadius.circular(20),
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
                                horizontal: 25,
                              ),
                              child: Text(
                                'Telefono',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
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
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                'https://thumbs.dreamstime.com/z/mundo-ancho-del-web-11899748.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                              child: Text(
                                'Pagina',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
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
