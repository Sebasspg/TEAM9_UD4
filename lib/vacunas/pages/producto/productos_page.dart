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
        title: const Text(
          'Mis Vacunas',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 89, 176, 247),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoData.deleteAll();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                "https://cdn.pixabay.com/photo/2017/10/04/09/56/laboratory-2815639_960_720.jpg"),
          ),
          MaterialButton(
            minWidth: 200,
            color: const Color.fromARGB(255, 17, 0, 255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreatePage()));
            },
            child: const Text(
              'Registrar Vacuna',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
    );
  }
}
