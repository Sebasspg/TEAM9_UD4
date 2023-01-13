import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/alergia/pages/alergia_productos/alergycreate_pages.dart';
import 'package:team9_ud3_project/alergia/pages/alergia_productos/updatealerg_pages.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';

class ProductosAlergiaPage extends StatelessWidget {
  const ProductosAlergiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<AlergiaProvider>(context);
    productoData.queryAllA();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(children: [
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
                                "REGISTRO DE ALERGIAS",
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
          Stack(
            children: [
              SizedBox(
                child: Image.asset('assets/alergia/alergiaim.png'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productoData.product.length,
              itemBuilder: (BuildContext context, int index) {
                final data = productoData.product[index];

                return ListTile(
                  title: Text('${data.nombre} /Alergico a ${data.categoria}  '),
                  subtitle: Text('detectado el ${data.describe} '),
                  trailing: IconButton(
                    onPressed: () {
                      productoData.delete(data.id);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateAlergiaPage(
                          product: data,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(255, 152, 111, 175),
                    Color.fromARGB(255, 74, 178, 214),      
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "AÑADIR ALERGIA",
                    style: GoogleFonts.quicksand(
                          fontSize: 11, fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/medicinas/flechamed.png',
                    alignment: Alignment.centerRight,
                    scale: 4,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAlergiaPage()));
            },
          ),
        ]),
      ),
    );
  }
}
