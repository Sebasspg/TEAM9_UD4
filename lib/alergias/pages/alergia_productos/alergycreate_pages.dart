import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';

final nombreController = TextEditingController();
final categoriaController = TextEditingController();
final describeController = TextEditingController();

class CreateAlergiaPage extends StatelessWidget {
  const CreateAlergiaPage({super.key});

  @override
    Widget build(BuildContext context) {
    final productoProvider = Provider.of<AlergiaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 65, 65),
        title: const Text(
          'Ingresar Alergias',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  "https://cdn.pixabay.com/photo/2018/03/21/19/22/doctor-3247901_960_720.png"),
              const SizedBox(
                height: 10,
              ),
            CustomTextFormField(
              controller: nombreController,
              hintText: 'Es medicamento/Alimento',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: categoriaController,
              hintText: 'Menciona',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: describeController,
              hintText: 'Fecha de detección',
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              minWidth: 200,
              color: Color.fromARGB(255, 224, 65, 65),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                productoProvider.insertProducto(
                    nombreController.text,
                    categoriaController.text,
                    describeController.text
                    );

                nombreController.clear();
                categoriaController.clear();
                describeController.clear();
              },
              child: const Text(
                'Guardar Producto',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;

  const CustomTextFormField(
      {super.key, this.controller, this.keyboardType, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 224, 65, 65)),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 224, 65, 65)),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 224, 65, 65),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
