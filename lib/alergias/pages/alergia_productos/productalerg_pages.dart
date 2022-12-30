import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/alergias/pages/alergia_productos/alergycreate_pages.dart';
import 'package:team9_ud3_project/alergias/pages/alergia_productos/updatealerg_pages.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';

class ProductosAlergiaPage extends StatelessWidget {
  const ProductosAlergiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<AlergiaProvider>(context);
    productoData.queryAllA();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Alergias',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 224, 65, 65),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoData.deleteAllA();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                "https://cdn.pixabay.com/photo/2021/06/30/18/32/vaccination-6377434_960_720.png"),
          ),
          MaterialButton(
            minWidth: 200,
            color: Color.fromARGB(255, 224, 65, 65),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateAlergiaPage()));
            },
            child: const Text(
              'Registrar Alergias',
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
            title: Text('${data.nombre} | ${data.categoria}  '),
            subtitle: Text(' ${data.describe} '),
            trailing: IconButton(
              onPressed: () {
                productoData.delete(data.id);
              },
              icon: const Icon(
                Icons.health_and_safety,
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
          )
    ]
      ),
    );
  }
}
