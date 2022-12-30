


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/medicina_model.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';

class UpdateMedicinaPage extends StatefulWidget {
  final ProductoMedicina product;

  const UpdateMedicinaPage({super.key, required this.product});

  @override
  State<UpdateMedicinaPage> createState() => _UpdateMedicinaPageState();
}

class _UpdateMedicinaPageState extends State<UpdateMedicinaPage> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    final nombreController = TextEditingController(text: data.nombre);
    final categoriaController = TextEditingController(text: data.categoria);
    final inicioController = TextEditingController(text: data.inicio);
    final finController = TextEditingController(text: data.fin);
    final intervaloController = TextEditingController(text: data.intervalo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Medicación'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
              keyboardType: TextInputType.name,
            ),

             CustomTextFormField(
              controller: intervaloController,
              hintText: 'Intervalo',
              keyboardType: TextInputType.name,
            ),

            MaterialButton(
              minWidth: 200,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                final productoProvider =
                    Provider.of<MedicinaProvider>(context, listen: false);

                productoProvider.updateM(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    inicioController.text,
                    finController.text,
                    intervaloController.text);
              },
              child: const Text(
                'Actulizar Medicación',
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
          borderSide: const BorderSide(width: 1, color: Colors.green),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(3),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 156, 255, 149),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
