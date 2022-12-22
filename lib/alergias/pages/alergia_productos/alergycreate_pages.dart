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
        title: const Text('Crear Alergia'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
              keyboardType: TextInputType.name,
            ),
            MaterialButton(
              minWidth: 200,
              color: Colors.green,
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
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 186, 237, 4)),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 230, 220, 28)),
          borderRadius: BorderRadius.circular(7),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 186, 216, 13),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
