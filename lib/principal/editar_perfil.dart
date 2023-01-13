import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/preferences/logearse_preferences.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';

class EditarPerfil extends StatefulWidget {
  EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellidos = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController peso = TextEditingController();
  final TextEditingController altura = TextEditingController();
  final TextEditingController tiposangre = TextEditingController();

  final items = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  String? values;
  String genero = 'No definido';

  @override
  Widget build(BuildContext context) {
    var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

    var colorazul = const Color.fromARGB(255, 109, 150, 195);
    var colorazulceleste = const Color.fromARGB(255, 51, 198, 244);
    final userProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Row(
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
                      Image.asset(
                        'assets/login/login_logo.png',
                        width: MediaQuery.of(context).size.width * 0.245,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Text(
                "EDITAR PERFIL",
                style: GoogleFonts.quicksand(
                    fontSize: 19.7, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              Row(
                children: [
                  Image.asset(
                        'assets/perfil/1.png',
                        width: MediaQuery.of(context).size.width * 0.075,
                      ),
                      SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
                  Text(
                    'INFORMACION BÁSICA',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.4, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              Text(
                'Nombres',
                style: GoogleFonts.quicksand(
                    fontSize: 13.001,
                    fontWeight: FontWeight.w500,
                    height: 1.9,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
                child: TextFormField(
                  controller: nombre,
                  decoration: _buildDecoration(),
                  style: GoogleFonts.quicksand(
                      fontSize: 13.001,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Edad',
                style: GoogleFonts.quicksand(
                    fontSize: 13.001,
                    fontWeight: FontWeight.w500,
                    height: 1.9,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
                child: TextFormField(
                  controller: edad,
                  decoration: _buildDecoration(),
                  style: GoogleFonts.quicksand(
                      fontSize: 13.001,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Genero',
                style: GoogleFonts.quicksand(
                    fontSize: 13.001,
                    fontWeight: FontWeight.w500,
                    height: 1.9,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          genero = " Masculino";
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width * 0.35,
                      color: colorbienceleste,
                      child: Text(
                        "MASCULINO",
                        style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          genero = " Femenino";
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width * 0.35,
                      color: colorbienceleste,
                      child: Text(
                        "FEMENINO",
                        style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              Row(
                children: [
                  Image.asset(
                        'assets/perfil/2.png',
                        width: MediaQuery.of(context).size.width * 0.075,
                      ),
                      SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
                  Text(
                    'DATOS GENERALES',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.4, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Altura",
                      style: GoogleFonts.quicksand(
                          fontSize: 13.001,
                          fontWeight: FontWeight.w500,
                          height: 1.9,
                          color: Colors.black),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: altura,
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      width: 1,
                      thickness: 1,
                    ),
                    Text(
                      "Peso",
                      style: GoogleFonts.quicksand(
                          fontSize: 13.001,
                          fontWeight: FontWeight.w500,
                          height: 1.9,
                          color: Colors.black),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: peso,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                "Tipo de Sangre",
                style: GoogleFonts.quicksand(
                    fontSize: 13.001,
                    fontWeight: FontWeight.w500,
                    height: 1.9,
                    color: Colors.black),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.11,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(
                      'Seleccione: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    value: values,
                    isExpanded: true,
                    items: items
                        .map((String item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.quicksand(),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => values = value),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.34,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [colorazulceleste, colorazul])),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Avatar (opcional)",
                                style: GoogleFonts.quicksand(
                                    fontSize: 13.5, fontWeight: FontWeight.w600, color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  userProvider.activeGalleryImg();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150),
                                    color: Color.fromARGB(255, 230, 231, 232),
                                  ),
                                  child: (userProvider.image != null)
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(48),
                                            child: Image.file(
                                              userProvider.image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: MaterialButton(
                  color: colorbienceleste,
                  onPressed: () {
                    final serpiente = SnackBar(
                      content: Text(
                        'Datos Actualizados!!!',
                        style: GoogleFonts.quicksand(fontSize: 20),
                      ),
                      backgroundColor: const Color.fromARGB(255, 111, 194, 127),
                    );

                    userProvider.subirImgStorage();
                    userProvider.uptusuario(
                        Preferences.identificador,
                        nombre.text,
                        edad.text,
                        genero,
                        peso.text,
                        altura.text,
                        values!);
                    userProvider.getusuario(Preferences.identificador);
                    print(values);
                    ScaffoldMessenger.of(context).showSnackBar(serpiente);
                  },
                  child: Text(
                    'CONFIRMAR',
                    style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w900, color: Colors.white
                      ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
  );
}
