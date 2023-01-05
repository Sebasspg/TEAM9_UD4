import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/principal/controlador_principal.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';
import 'package:team9_ud3_project/utils/constant.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool _ispassword = true;

  void _viewpassword() {
    setState(() {
      _ispassword = !_ispassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
                width: 200,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Text(
                  "¡BIENVENIDO!",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Estamos listos para cuidar de tu salud",
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(
                  'assets/login/login_corazon.png',
                  scale: 3,
                )
              ],
            ),
            largeGap,
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.green])),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 300,
                    height: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Correo Electronico ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _buildDecoration(
                                hintText: "dev@flutter.com",
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.green,
                                )),
                            onChanged: (value) => _emailController.text = value,
                            validator: (value) {
                              String caracteres =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                              RegExp regExp = RegExp(caracteres);
                              return regExp.hasMatch(value ?? "")
                                  ? null
                                  : "No es un correo valido";
                            },
                          ),
                          const Text(
                            "Contraseña :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            autocorrect: false,
                            obscureText: _ispassword,
                            keyboardType: TextInputType.text,
                            decoration: _buildDecoration(
                              hintText: "*********",
                              prefixIcon: const Icon(
                                Icons.key_outlined,
                                color: Colors.green,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  _viewpassword();
                                },
                                child: Icon(_ispassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            onChanged: (value) =>
                                _passwordController.text = value,
                            validator: ((value) {
                              print(value);
                              return (value != null && value.length >= 8)
                                  ? null
                                  : "Debe tener minimo 8 caracteres";
                            }),
                          ),
                          // TextFormField(
                          //   controller: _emailController,
                          // ),
                          // smallGap,
                          // TextFormField(
                          //   controller: _passwordController,
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                color: Colors.white,
                                onPressed: () async {
                                  // Login(_emailController.text, _passwordController.text);
                                  final String? errorMessage =
                                      await authService.login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );

                                  if (errorMessage == null) {
                                    // ignore: use_build_context_synchronously
                                    // Navigator.pushNamed(context, '/simpleapp');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ControladorPrincipal())));
                                  }
                                },
                                child: const Text(
                                  'Inicia Sesion',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: const Text('Registrarte'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/login/logingux.png',
            )
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
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.green),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.green),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.green),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.green),
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(5),
  );
}
