import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text(
          'Mis Medicinas',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 8, 239, 127),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoData.deleteAllM();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                "https://cdn.pixabay.com/photo/2021/01/13/13/42/coronavirus-5914156_960_720.png"),
          ),
          MaterialButton(
            minWidth: 200,
            color: Color.fromARGB(255, 8, 239, 127),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateMedicinaPage()));
            },
            child: const Text(
              'Registrar Medicinas',
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
            title: Text('Vía ${data.nombre} : ${data.categoria}'),
            subtitle: Text('Inicio: ${data.fin} ${data.inicio} | cada ${data.intervalo} hora(s)'),
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
          ],
            ),
    );
  }
}
