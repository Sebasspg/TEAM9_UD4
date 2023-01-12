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

  final items = ['A+', 'O+', 'B+', 'AB+'];

  String? values;
  String genero = 'No definido';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/login/login_logo.png',
              scale: 3,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EDITAR PERFIL",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              'INFORMACION BÁSICA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Nombres'),
            TextFormField(
              controller: nombre,
              decoration: _buildDecoration(),
            ),
            const Text('Apellido'),
            TextFormField(
              controller: apellidos,
              decoration: _buildDecoration(),
            ),
            const Text('Edad'),
            TextFormField(
              controller: edad,
              decoration: _buildDecoration(),
            ),
            const Text('Genero'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      genero = " Masculino";
                    });
                  },
                  color: Colors.blue,
                  child: const Text(
                    "Masculino",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      genero = " Femenino";
                    });
                  },
                  color: Colors.blue,
                  child: const Text(
                    "Femenino",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Altura"),
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
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
                  const Text("Peso"),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    width: 80,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: peso,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Tipo de Sangre"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    'Seleccione: ',
                    style: GoogleFonts.quicksand(),
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
              height: 20,
            ),
            InkWell(
              onTap: () {
                userProvider.activeGalleryImg();
              },
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.grey,
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
                        Icons.add_a_photo_rounded,
                        color: Colors.white,
                        size: 100,
                      ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  final serpiente = SnackBar(
                    content: Text(
                      'Datos Actualizados!!!',
                      style: GoogleFonts.quicksand(fontSize: 20),
                    ),
                    backgroundColor: Colors.green,
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
                  'Actualizar datos',
                  style: GoogleFonts.quicksand(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
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
    contentPadding: const EdgeInsets.all(5),
  );
}
