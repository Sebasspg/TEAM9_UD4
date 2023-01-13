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
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

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
                            "NUTRICIÓN",
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
            height: MediaQuery.of(context).size.height * 0.94,
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
        ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'CONTROL NUTRICIONAL',
              style: GoogleFonts.quicksand(
                  fontSize: 18.5, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 51, 198, 244),
                  Color.fromARGB(255, 109, 150, 195),
                ],
              ),
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usuarioProviders.nombrelocal,
                          style: GoogleFonts.quicksand(
                              fontSize: 16.4,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                '${usuarioProviders.edadlocal} Años',
                                style: GoogleFonts.quicksand(
                                    fontSize: 12.4,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              Text(
                                'Altura: ${usuarioProviders.alturalocal}cm',
                                style: GoogleFonts.quicksand(
                                    fontSize: 12.4,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
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
                          'PESO',
                          style: GoogleFonts.quicksand(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              usuarioProviders.pesolocal,
                              style: GoogleFonts.quicksand(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Kg',
                              style: GoogleFonts.quicksand(
                                  fontSize: 16.4,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
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
                        Color.fromARGB(255, 51, 198, 244),
                        Color.fromARGB(255, 111, 194, 127)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ESTADO NUTRICIONAL : ',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          '${pesosProvider.msg}',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
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
                            Color.fromARGB(255, 242, 234, 38),
                            Color.fromARGB(255, 251, 173, 48),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ESTADO NUTRICIONAL : ',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '${pesosProvider.msg}',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ESTADO NUTRICIONAL : ',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  '${pesosProvider.msg}',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
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
                                Color.fromARGB(255, 248, 156, 50),
                                Color.fromARGB(255, 237, 50, 55),
                              ],
                            ),
                          ),
                          child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ESTADO NUTRICIONAL : ',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          '${pesosProvider.msg}',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                        ),
          SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HORARIOS',
                    style: GoogleFonts.quicksand(
                        fontSize: 14.5, fontWeight: FontWeight.w800),
                  ),
                  Text(
              'Seleccione un horario para calcular',
              style: GoogleFonts.quicksand(
                        fontSize: 13.4, fontWeight: FontWeight.w500),
          ),
                ],
              ),
            ),
          ),
          SizedBox(
                height: MediaQuery.of(context).size.width * 0.045,
              ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
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
                        radius: MediaQuery.of(context).size.width * 0.135,// Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg'),
                      ),
                      SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
                      Text(
                        '09:00',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'DESAYUNO',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.043,
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
                        radius: MediaQuery.of(context).size.width * 0.135, // Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2017/09/12/21/47/noodles-2743779_960_720.jpg'),
                      ),
                      SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
                      Text(
                        '13:00',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'ALMUERZO',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.043,
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
                        radius: MediaQuery.of(context).size.width * 0.135, // Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2014/09/11/11/17/prawn-441623_960_720.jpg'),
                      ),
                      SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
                      Text(
                        '20:00',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'CENA',
                        style: GoogleFonts.quicksand(
                            fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RESULTADO',
                    style: GoogleFonts.quicksand(
                        fontSize: 14.5, fontWeight: FontWeight.w800),
                  ),
                  Text(
              'Para mantener un estado nutricional saludable, usted requiere de...',
              style: GoogleFonts.quicksand(
                        fontSize: 13.4, fontWeight: FontWeight.w500),
          ),
                ],
              ),
            ),
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
