import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        title: const Text('Mis Alergias'),
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
      body: ListView.builder(
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
    );
  }
}
