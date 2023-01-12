import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
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
           
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text('ACTUALIZAR ALERGIA',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 16), ),
        Image.asset('assets/alergia/login_logo.png', scale: 3),
        ],
        ),
        
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              const Text('EDITAR ALERGIA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

                TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor:Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "¿Medicamento o Alimento?",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(119, 0, 0, 0), fontWeight: FontWeight.bold),
                ),),
              TextField(
                controller: categoriaController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor:Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Mencione su Alergia",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(119, 0, 0, 0), fontWeight: FontWeight.bold),
                ),),
              TextField(
                controller: describeController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor:Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Fecha de Detección",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(119, 0, 0, 0), fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  DateTime? pickeDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  print(describeController);
                  if (pickeDate != null) {
                    ( {
                      describeController.text =
                          DateFormat('dd-MM-yyyy').format(pickeDate)
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
                             InkWell(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                       gradient: const LinearGradient(colors: <Color>[
                     Color.fromARGB(255, 120, 87, 204),
                     Color.fromARGB(255, 34, 172, 223),
                     ],
                     ),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "ACTUALIZAR",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () { final productoProvider =
                    Provider.of<AlergiaProvider>(context, listen: false);

                productoProvider.updateA(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    describeController.text);
                },

              ),

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
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 20, color: Colors.white),
          borderRadius: BorderRadius.circular(0),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
