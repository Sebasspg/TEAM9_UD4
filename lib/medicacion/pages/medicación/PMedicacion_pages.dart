import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/crearmedicacion_pages.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/updatemedicina_pages.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';

class ProductosMedicinaPage extends StatelessWidget {
  const ProductosMedicinaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<MedicinaProvider>(context);
    productoData.queryAllM();
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
                                "MEDICACIÓN",
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
                      child: Image.asset('assets/medicinas/medicinasmed.png')),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productoData.product.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = productoData.product[index];

                    return ListTile(
                      title: Text('Vía ${data.nombre} : ${data.categoria}'),
                      subtitle: Text(
                          'Inicio: ${data.fin} ${data.inicio} | cada ${data.intervalo} hora(s)'),
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
                            builder: (context) => UpdateMedicinaPage(
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
                          Color.fromARGB(233, 115, 159, 203),
                          Color.fromARGB(255, 34, 172, 223),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "AÑADIR MEDICINA",
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
                            builder: (context) => const CreateMedicinaPage()));
                  }),
            ],
          ),
        ));
  }
}
