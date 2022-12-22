import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/model/Alerg_model.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';


class UpdateAlergiaPage extends StatefulWidget {
  final ProductoAlergia product;

  const UpdateAlergiaPage({super.key, required this.product});

  @override
  State<UpdateAlergiaPage> createState() => _UpdateAlergiaPageState();
}

class _UpdateAlergiaPageState extends State<UpdateAlergiaPage> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    final nombreController = TextEditingController(text: data.nombre);
    final categoriaController = TextEditingController(text: data.categoria);
    final describeController = TextEditingController(text: data.describe);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextFormField(
              controller: nombreController,
              hintText: 'Nombre producto',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: categoriaController,
              hintText: 'Categoria',
              keyboardType: TextInputType.name,
            ),
            CustomTextFormField(
              controller: describeController,
              hintText: 'Precio Compra',
              keyboardType: TextInputType.name,
            ),

            MaterialButton(
              minWidth: 200,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                final productoProvider =
                    Provider.of<AlergiaProvider>(context, listen: false);

                productoProvider.updateA(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    describeController.text);
              },
              child: const Text(
                'Actulizar Producto',
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
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 156, 255, 149),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
