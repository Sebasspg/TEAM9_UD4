import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';

final nombreController = TextEditingController();
final categoriaController = TextEditingController();
final inicioController = TextEditingController();
final finController = TextEditingController();
final intervaloController = TextEditingController();

class CreateMedicinaPage extends StatelessWidget {
  const CreateMedicinaPage({super.key});

  @override
    Widget build(BuildContext context) {
    final productoProvider = Provider.of<MedicinaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 239, 127),
        title: const Text(
          'Ingresar Medicinas',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
                  "https://media.istockphoto.com/id/1400681129/es/vector/conjunto-de-iconos-de-medicamentos-instrumentos-m%C3%A9dicos-diagn%C3%B3stico-y-tratamiento-pastillas.jpg?b=1&s=170667a&w=0&k=20&c=_FimOoVXTD7X9rZuEsyqxN7CBEULqMJT2qnZW4_3iuY="),
              const SizedBox(
                height: 10,
              ),
            CustomTextFormField(
              controller: nombreController,
              hintText: 'Via Oral/ Intramuscular/Intravenoso',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: categoriaController,
              hintText: 'Medicamento',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: inicioController,
              hintText: 'Fecha de Inicio',
              keyboardType: TextInputType.number,
            ),
              CustomTextFormField(
              controller: intervaloController,
              hintText: 'Intervalo',
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              minWidth: 200,
              color: Color.fromARGB(255, 8, 239, 127),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                productoProvider.insertProducto(
                    nombreController.text,
                    categoriaController.text,
                    inicioController.text,
                    finController.text,
                    intervaloController.text
                    );

                nombreController.clear();
                categoriaController.clear();
                inicioController.clear();
                finController.clear();
                intervaloController.clear();
              },
              child: const Text(
                'Guardar Medicación',
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
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 8, 239, 127)),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 8, 239, 127)),
          borderRadius: BorderRadius.circular(7),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 8, 239, 127),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
