import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/recetas_saludables/busq_cat.dart';
import 'package:team9_ud3_project/recetas_saludables/busqueda.dart';

class NutriHome extends StatelessWidget {
  const NutriHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
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
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                              Text(
                                "RECETAS SALUDABLES",
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
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Todas las Recetas',
                                style: GoogleFonts.quicksand(
                                    fontSize: 24.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Por categoria',
                                style: GoogleFonts.quicksand(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
                                Image.asset(
                                  "assets/recetas/rsguxpartido.png",
                                  width: MediaQuery.of(context).size.height * 0.13,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/recetas/rsplatosfondo.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => BusquedaPage())));
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                child: GridView.count(
                    primary: false,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '5'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/icons/loading.gif',
                                image:
                                    'https://cdn.pixabay.com/photo/2017/07/27/17/30/tray-2546077_960_720.jpg',
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS SENCILLAS',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      //'https://cdn.pixabay.com/photo/2017/07/27/17/30/tray-2546077_960_720.jpg'
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '6'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/icons/loading.gif',
                                image:
                                    'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_960_720.jpg',
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS VEGANAS',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      //'https://cdn.pixabay.com/photo/2016/08/25/19/50/vegetables-1620537_960_720.jpg'
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '7'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/icons/loading.gif',
                                image:
                                    'https://cdn.pixabay.com/photo/2016/11/06/23/16/breakfast-1804436_960_720.jpg',
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS PARA EL DESAYUNO',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      /*
                      'https://cdn.pixabay.com/photo/2016/11/06/23/16/breakfast-1804436_960_720.jpg'
                       */
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '8'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/icons/loading.gif',
                                image:
                                    'https://cdn.pixabay.com/photo/2017/03/26/11/53/hors-doeuvre-2175326_960_720.jpg',
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS PROTEICAS',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      //'https://cdn.pixabay.com/photo/2017/03/26/11/53/hors-doeuvre-2175326_960_720.jpg',
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '9'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/icons/loading.gif',
                                  image:
                                      'https://cdn.pixabay.com/photo/2018/10/10/22/28/lentil-soup-3738547_960_720.jpg'),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS CON LEGUMBRES',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      /*---------------------------------------------------------------------------------- */
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const BusquePorPage(id_cat: '10'))));
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              //'https://cdn.pixabay.com/photo/2016/03/05/23/01/prawn-1239427_960_720.jpg'
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/icons/loading.gif',
                                  image:
                                      'https://cdn.pixabay.com/photo/2016/03/05/23/01/prawn-1239427_960_720.jpg'),
                              height: 190,
                              width: 250,
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 250,
                            child:
                                Image.asset('assets/recetas/rscapaoscura.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'RECETAS CON MARISCOS',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
              /*
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Gux ',
                                  style: GoogleFonts.quicksand(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'eligio estas receta para ti',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/recetas/rsgux.png'),
                      ),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
