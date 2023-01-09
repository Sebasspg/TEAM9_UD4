import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/create_page.dart';
import 'package:team9_ud3_project/vacunas/pages/producto/update_page.dart';
import 'package:team9_ud3_project/providers/producto_provider.dart';
//import 'package:intl/intl.dart

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<ProductoProvider>(context);
    productoData.queryAll();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "REGISTRO DE VACUNAS",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 17,
              ),
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2.5,
              ),
            ],
          ),
        ],
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       productoData.deleteAll();
        //     },
        //     icon: const Icon(Icons.delete),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image.asset("assets/vacunas/vc_imgtodo.png"),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "MIS VACUNAS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            minWidth: 100,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              productoData.deleteAll();
                            },
                            child: const Text(
                              'BORRAR TODO',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.green])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "AÑADIR VACUNA",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/ejercicio/derechablanca.png",
                      scale: 2,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePage()));
              },
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productoData.product.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = productoData.product[index];

                  return ListTile(
                    title: Text(
                        '${data.nombre} | Duracion:  ${data.categoria}  meses'),
                    subtitle: Text(' Fecha de Inyeccion: ${data.stock} '),
                    textColor: Colors.blueGrey,
                    trailing: IconButton(
                      onPressed: () {
                        productoData.delete(data.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePage(
                            product: data,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
