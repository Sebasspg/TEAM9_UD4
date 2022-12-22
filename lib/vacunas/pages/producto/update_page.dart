import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/producto_model.dart';
import 'package:team9_ud3_project/providers/producto_provider.dart';
import 'package:intl/intl.dart';

class UpdatePage extends StatefulWidget {
  final Producto product;

  const UpdatePage({super.key, required this.product});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    final nombreController = TextEditingController(text: data.nombre);
    final categoriaController = TextEditingController(text: data.categoria);
    final precioCController = TextEditingController(text: data.precioc);
    final precioVController = TextEditingController(text: data.preciov);
    final stockController = TextEditingController(text: data.stock);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Vacuna'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 81, 181, 251)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 149, 246, 255),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Nombre de la vacuna",
                  hintStyle: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                )),
            TextField(
              controller: stockController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 81, 181, 251)),
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 149, 246, 255),
                contentPadding: const EdgeInsets.all(15),
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.blue,
                ),
              ),
              onTap: () async {
                DateTime? pickeDates = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickeDates != null) {
                  stockController.text =
                      DateFormat('dd-MM-yyyy').format(pickeDates);
                }
              },
            ),
            TextField(
                controller: categoriaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 81, 181, 251)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 149, 246, 255),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Duracion de la vacuna en meses",
                  hintStyle: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  icon: const Icon(
                    Icons.timelapse_outlined,
                    color: Colors.blue,
                  ),
                )),
            MaterialButton(
              minWidth: 200,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                final productoProvider =
                    Provider.of<ProductoProvider>(context, listen: false);

                productoProvider.upload(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    precioCController.text,
                    precioVController.text,
                    stockController.text);
              },
              child: const Text(
                'Actualizar Vacuna',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
