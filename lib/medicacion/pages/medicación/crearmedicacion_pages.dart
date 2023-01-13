import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            height: 180,
            child: Image.asset("assets/medicinas/guxalerta.png"),
          ),
          content: Text(
            "¿Añadir medicamento?",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
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
                      height: 180,
                      child: Image.asset("assets/medicinas/guxpositivo.png"),
                    ),
                    content: Text(
                      'Se añadió el medicamento',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          fontSize: 15, fontWeight: FontWeight.w600),
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
                              "AÑADIR MEDICAMENTO",
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
                      "NUEVO MEDICAMENTO",
                      style: GoogleFonts.quicksand(
                          fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                height: 20,
              ),
                    TextField(
                      controller: nombreController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
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
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
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
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
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
                          ({
                            inicioController.text =
                                DateFormat('dd-MM-yyyy').format(pickeDate),
                          });
                        }
                      },
                    ),
                    TextField(
                      controller: intervaloController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(15),
                        hintText: "Menciona cada cuantas horas debe tomarlo",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(119, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
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
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(233, 115, 159, 203),
                              Color.fromARGB(255, 34, 172, 223),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "GUARDAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
            const Spacer(flex: 2,),
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
