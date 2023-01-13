import 'package:google_fonts/google_fonts.dart';
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
            height: 180,
            child: Image.asset("assets/vacunas/vc_valid_guxalert.png"),
          ),
          content: Text(
            "¿Añadir vacuna?",
            textAlign: TextAlign.center,style: GoogleFonts.quicksand(
                    fontSize: 15, fontWeight: FontWeight.w600),
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
                      height: 180,
                      child:
                          Image.asset("assets/vacunas/vc_valid_guxcheck.png"),
                    ),
                    content: Text(
                      'Se añadió la vacuna',
                      textAlign: TextAlign.center, style: GoogleFonts.quicksand(
                    fontSize: 15, fontWeight: FontWeight.w600),
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
                            vacunaProvider
                                .getVacunas(Preferences.identificador);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  child: Image.asset(
                                      'assets/menuprincipal/bien/flecha_negra_volver.png'),
                                  onPressed: () {
                                    Navigator.pop(
                                      (context),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.046,
                            ),
                            Text(
                              "AÑADIR VACUNA",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/login/login_logo.png',
                      width: MediaQuery.of(context).size.width * 0.245,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NUEVA VACUNA",
                      style: GoogleFonts.quicksand(
                          fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                height: 20,
              ),
                    Text(
                "Nombre de la vacuna",
                style: GoogleFonts.quicksand(
                            fontSize: 13.001,
                            fontWeight: FontWeight.w500,
                            height: 1.9,
                            color: Colors.black),
              ),
              TextField(
                controller: nombreController,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Fecha de Inyeccion",
               style: GoogleFonts.quicksand(
                            fontSize: 13.001,
                            fontWeight: FontWeight.w500,
                            height: 1.9,
                            color: Colors.black),
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
              Text(
                "Duracion de la vacuna (en meses)",
                style: GoogleFonts.quicksand(
                            fontSize: 13.001,
                            fontWeight: FontWeight.w500,
                            height: 1.9,
                            color: Colors.black),
              ),
              TextField(
                controller: duracionController,
                keyboardType: TextInputType.number,
              ),
                          InkWell(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [const Color.fromARGB(255, 51, 198, 244), const Color.fromARGB(255, 111, 194, 127)])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "GUARDAR",
                      style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            height: 1.9,
                            color: Colors.white),
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
            

            /*  CustomTextFormField(
              controller: stockController,
              hintText: 'Stock',
              keyboardType: TextInputType.number,
            ), */


            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
