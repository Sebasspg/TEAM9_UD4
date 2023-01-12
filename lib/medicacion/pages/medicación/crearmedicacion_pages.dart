import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    
        void alertCustom(BuildContext context) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: SizedBox(
            height: 200,
            child: Image.asset("assets/medicinas/guxalerta.png"),
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
                    inicioController.text,
                    finController.text,
                    intervaloController.text),
                nombreController.clear(),
                categoriaController.clear(),
                inicioController.clear(),
                finController.clear(),
                intervaloController.clear(),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: SizedBox(
                      height: 200,
                      child:
                          Image.asset("assets/medicinas/guxpositivo.png"),
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
                inicioController.clear(),
                finController.clear(),
                intervaloController.clear(),
              }
          });
    }
    
    
    return Scaffold(
      appBar: AppBar(
           
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text('AÑADIR MEDICAMENTO',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 16), ),
        Image.asset('assets/alergia/login_logo.png', scale: 3),
        ],
        ),
        
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              const Text('NUEVO MEDICAMENTO',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 16),) ,
              
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
                controller: intervaloController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor:Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Menciona cada cuantas horas debe tomarlo",
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
                        "GUARDAR",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () { 
                  alertCustom(context);                },
              ),],
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
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(7),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}

