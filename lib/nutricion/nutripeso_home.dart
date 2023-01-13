import 'package:flutter/material.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:team9_ud3_project/widgets/grafico_dona.dart';
import 'package:team9_ud3_project/widgets/loading_custom.dart';
import 'package:team9_ud3_project/model/usuarios_model.dart';

class NutriPage extends StatelessWidget {
  const NutriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NUTRICIÓN',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Image.asset(
                'assets/recetas/rslogo.png',
                height: 50,
                width: 110,
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: vistaPeso(),
            // child: FutureBuilder(
            //   future: usuarioProvider.getusuario(Preferences.identificador),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       List _snapshot = snapshot.data as List;
            //       return ListView.builder(
            //           itemCount: _snapshot.length,
            //           itemBuilder: (context, index) {
            //             Users usuaarios = _snapshot[index];
            //             return vistaPeso(usarioos: usuaarios);
            //             //vistaPeso(usarioos: usuaarios); Text(usuaarios.nombre);
            //           });
            //     }
            //     return LoadingCustom(
            //       textoCarga: 'Cargando pesos...',
            //     );
            //   },
            // ),
          ),
        ));
  }
}

class vistaPeso extends StatelessWidget {
  const vistaPeso({super.key});

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    final usuarioProviders = Provider.of<UsuarioProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView(
        children: [
          SizedBox(height: 8),
          Text(
            'CONTROL NUTRICIONAL',
            style: GoogleFonts.quicksand(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 79, 166, 236),
                  Color.fromARGB(255, 8, 134, 236),
                ],
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        usuarioProviders.nombrelocal,
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontSize: 20),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              '${usuarioProviders.edadlocal} años',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            Text(
                              'Altura ${usuarioProviders.alturalocal}cm',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    indent: 42,
                    endIndent: 42,
                    thickness: 0.5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Peso',
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            usuarioProviders.pesolocal,
                            style: GoogleFonts.quicksand(
                                color: Colors.white, fontSize: 45),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Kg',
                            style: GoogleFonts.quicksand(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          (pesosProvider.msg == 'Normal')
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueAccent,
                        Colors.green,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ESTADO NUTRICIONAL : ',
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${pesosProvider.msg}',
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : (pesosProvider.msg == 'Delgadez')
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ESTADO NUTRICIONAL : ',
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${pesosProvider.msg}',
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : (pesosProvider.msg == 'X')
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.grey,
                                Colors.grey,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ESTADO NUTRICIONAL : ',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${pesosProvider.msg}',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.orange,
                                Colors.red,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ESTADO NUTRICIONAL : ',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${pesosProvider.msg}',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
          SizedBox(
            height: 25,
          ),
          Text(
            'HORARIOS',
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Seleccione un horario para calcular',
            style: GoogleFonts.quicksand(fontSize: 18),
          ),
          SizedBox(
            height: 200,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider
                          .getCalorias(int.parse(usuarioProviders.edadlocal));
                      pesosProvider.getCategoriaxIMC(
                          double.parse(usuarioProviders.pesolocal),
                          double.parse(usuarioProviders.alturalocal));
                      pesosProvider
                          .getProteinas(int.parse(usuarioProviders.pesolocal));
                      pesosProvider.getCarbohidratos(
                          int.parse(usuarioProviders.pesolocal));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55, // Image radius
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg'),
                        ),
                        Text(
                          '09:00',
                          style: GoogleFonts.quicksand(fontSize: 18),
                        ),
                        Text(
                          'Desayuno',
                          style: GoogleFonts.quicksand(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider.getCaloriasxAlmuerzo(
                          int.parse(usuarioProviders.edadlocal));
                      pesosProvider
                          .getProteinas(int.parse(usuarioProviders.pesolocal));
                      pesosProvider.getCarbohidratos(
                          int.parse(usuarioProviders.pesolocal));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55, // Image radius
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/09/12/21/47/noodles-2743779_960_720.jpg'),
                        ),
                        Text(
                          '13:00',
                          style: GoogleFonts.quicksand(fontSize: 18),
                        ),
                        Text(
                          'Almuerzo',
                          style: GoogleFonts.quicksand(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider.getCaloriasxCena(
                          int.parse(usuarioProviders.edadlocal));
                      pesosProvider
                          .getProteinas(int.parse(usuarioProviders.pesolocal));
                      pesosProvider.getCarbohidratos(
                          int.parse(usuarioProviders.pesolocal));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55, // Image radius
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2014/09/11/11/17/prawn-441623_960_720.jpg'),
                        ),
                        Text(
                          '20:00',
                          style: GoogleFonts.quicksand(fontSize: 18),
                        ),
                        Text(
                          'Cena',
                          style: GoogleFonts.quicksand(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'RESULTADO',
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Para mantener un estado nutricional saludable, usted requiere de',
            style: GoogleFonts.quicksand(
                fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            child: DonaWidget(),
          )
        ],
      ),
    );
  }
}
