import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/recetas_saludables/busq_cat.dart';
import 'package:team9_ud3_project/recetas_saludables/busqueda.dart';

class NutriHome extends StatelessWidget {
  const NutriHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Encuentra tu receta',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '5'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/07/27/17/30/tray-2546077_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas sencillas',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '6'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2016/08/25/19/50/vegetables-1620537_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas veganas',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '7'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2016/11/06/23/16/breakfast-1804436_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas para el desayuno',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '8'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/03/26/11/53/hors-doeuvre-2175326_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas proteicas',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '9'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2018/10/10/22/28/lentil-soup-3738547_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas con legumbres',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const BusquePorPage(id_cat: '10'))));
                            },
                            child: Container(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2016/03/05/23/01/prawn-1239427_960_720.jpg',
                                fit: BoxFit.cover,
                              ),
                              height: 190,
                              width: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recetas con Mariscos',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ]),
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BusquedaPage())));
                      },
                      child: Container(
                        color: Colors.green,
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/06/28/17/37/food-1485024_960_720.jpg',
                          fit: BoxFit.cover,
                        ),
                        height: 190,
                        width: 510,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Todas las recetas',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
