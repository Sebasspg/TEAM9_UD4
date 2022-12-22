import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:team9_ud3_project/providers/producto_provider.dart';

final nombreController = TextEditingController();
final categoriaController = TextEditingController();
final precioCController = TextEditingController();
final precioVController = TextEditingController();
final stockController = TextEditingController();

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    void alertCustom(BuildContext context) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.notification_important,
            color: Colors.amber,
            size: 100,
          ),
          content: const Text(
            "¿Seguro de guardar?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop('false'),
                child: const Text("Cancelar")),
            TextButton(
                onPressed: () => Navigator.of(context).pop('true'),
                child: const Text("Aceptar"))
          ],
        ),
      ).then((value) => {
            if (value == 'true')
              {
                productoProvider.insertProducto(
                    nombreController.text,
                    categoriaController.text,
                    precioCController.text,
                    precioVController.text,
                    stockController.text),
                nombreController.clear(),
                categoriaController.clear(),
                precioCController.clear(),
                precioVController.clear(),
                stockController.clear(),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 100,
                    ),
                    content: const Text(
                      'Se Registraron correctamente los datos',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop("true");
                          },
                          child: const Text("aceptar"))
                    ],
                  ),
                )
              }
            else
              {
                nombreController.clear(),
                categoriaController.clear(),
                precioCController.clear(),
                precioVController.clear(),
                stockController.clear(),
              }
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 176, 247),
        title: const Text(
          'Ingresar sus Vacunas',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  "https://cdn.pixabay.com/photo/2021/04/10/00/51/vaccine-6165772_960_720.jpg"),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
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
                  hintText: "Seleccionar fecha de Inyeccion",
                  hintStyle: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  DateTime? pickeDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  print(stockController);
                  if (pickeDate != null) {
                    setState(() {
                      stockController.text =
                          DateFormat('dd-MM-yyyy').format(pickeDate);
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 20,
              ),

              /*  CustomTextFormField(
                controller: stockController,
                hintText: 'Stock',
                keyboardType: TextInputType.number,
              ), */
              MaterialButton(
                minWidth: 300,
                color: const Color.fromARGB(255, 83, 76, 175),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  alertCustom(context);
                },
                child: const Text(
                  'Guardar Vacuna',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
