


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
           
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text('Alergias',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 22), ),
        Image.asset('assets/alergia/login_logo.png', scale: 3,),
        ],
        ),
        
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [const Text('EDITAR MEDICAMENTO', textAlign: TextAlign.left,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 25),),
               TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  
                  hintText: "Via,¿Oral, Intramuscular o Intravenosa?",
                  
                ),
            ),
            TextField(
                controller: categoriaController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(17),
                  
                  hintText: "Nombre del Medicamento",
                  
                ),
            ),
            TextField(
                controller: inicioController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(17),
                  
                  hintText: "Fecha de Inicio",
                  
                ),
                onTap: () async {
                  DateTime? pickeDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  print(inicioController);
                  if (pickeDate != null) {
                    ( {
                      inicioController.text =
                          DateFormat('dd-MM-yyyy').format(pickeDate),
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
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
                  hintText: "Intervalo",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(119, 0, 0, 0), fontWeight: FontWeight.bold),
                ),),

                      InkWell(
                child: Container(
                  height: 50,
                  width: double.infinity, 
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                       gradient: const LinearGradient(colors: <Color>[
                     Color.fromARGB(233, 115, 159, 203),
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
                onTap: () {
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
