import 'package:flutter/material.dart';

class EditarPerfil extends StatelessWidget {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellidos = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController peso = TextEditingController();
  final TextEditingController altura = TextEditingController();
  final TextEditingController tiposangre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola soy editar"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/login/login_logo.png',
                scale: 2,

                // fit: BoxFit.fill,
                // isAntiAlias: true,
              ),
              const SizedBox(
                width: 150,
              )
            ],
          ),
        ],
      ),
      body: Column(
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
            controller: telefono,
            decoration: _buildDecoration(),
          ),
          const Text('Genero'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  edad.text = " Masculino";
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
                  edad.text = " Femenino";
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Altura"),
              SizedBox(
                width: 40,
                child: TextFormField(
                  controller: altura,
                ),
              ),
              const Text("Peso"),
              SizedBox(
                width: 40,
                child: TextFormField(
                  controller: peso,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Tipo de Sangre"),
          TextFormField(
            controller: tiposangre,
          )
        ],
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
