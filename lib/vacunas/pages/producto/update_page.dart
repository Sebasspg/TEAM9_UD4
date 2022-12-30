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
    final productoProvider =
        Provider.of<ProductoProvider>(context, listen: false);

    void alertCustom2(BuildContext context) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.notification_important,
            color: Colors.orange,
            size: 100,
          ),
          content: const Text(
            "¿Seguro desea Actualizar?",
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
                productoProvider.upload(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    precioCController.text,
                    precioVController.text,
                    stockController.text),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 100,
                    ),
                    content: const Text(
                      'Se Actualizaron correctamente los datos',
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
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Vacuna'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  "https://cdn.pixabay.com/photo/2021/01/28/18/38/vaccination-5958739_960_720.png"),
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
              MaterialButton(
                minWidth: 200,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  alertCustom2(context);
                },
                child: const Text(
                  'Actualizar Vacuna',
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
