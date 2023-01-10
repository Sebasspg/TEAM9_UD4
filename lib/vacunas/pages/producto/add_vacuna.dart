import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:team9_ud3_project/providers/vacuna_provider.dart';

final nombreController = TextEditingController();
final duracionController = TextEditingController();
final fechaController = TextEditingController();

class addVacuna extends StatefulWidget {
  const addVacuna({super.key});

  @override
  State<addVacuna> createState() => _addVacunaState();
}

class _addVacunaState extends State<addVacuna> {
  @override
  Widget build(BuildContext context) {
    final vacunaProvider = Provider.of<VacunasProvider>(context);

    void alertCustom(BuildContext context) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: SizedBox(
            height: 200,
            child: Image.asset("assets/vacunas/vc_valid_guxalert.png"),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: SizedBox(
                      height: 200,
                      child:
                          Image.asset("assets/vacunas/vc_valid_guxcheck.png"),
                    ),
                    content: const Text(
                      'Se Registraron correctamente los datos',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            vacunaProvider.insertVacuna(
                                Preferences.identificador,
                                nombreController.text,
                                fechaController.text,
                                duracionController.text);
                            nombreController.clear();
                            duracionController.clear();
                            fechaController.clear();
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
                duracionController.clear(),
                fechaController.clear(),
              }
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "AÑADIR VACUNA",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 70,
              ),
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2.5,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "NUEVA VACUNA",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Nombre de la vacuna",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              TextField(
                controller: nombreController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Fecha de Inyeccion",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              TextField(
                controller: fechaController,
                onTap: () async {
                  DateTime? pickeDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  print(fechaController);
                  if (pickeDate != null) {
                    setState(() {
                      fechaController.text =
                          DateFormat('dd-MM-yyyy').format(pickeDate);
                    });
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Duracion de la vacuna (en meses)",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              TextField(
                controller: duracionController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),

              /*  CustomTextFormField(
                controller: stockController,
                hintText: 'Stock',
                keyboardType: TextInputType.number,
              ), */

              InkWell(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.green])),
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
                  alertCustom(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
