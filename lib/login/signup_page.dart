import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';
import 'package:team9_ud3_project/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool _ispassword = true;
  bool isChecked = false;
  Color colorin = Colors.amber;

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
                width: 150,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "REGISTRO",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  'assets/login/registergux.png',
                )
              ],
            ),
            largeGap,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Correo Electronico ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),

                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => emailController.text = value,
                    validator: (value) {
                      String caracteres =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                      RegExp regExp = RegExp(caracteres);
                      return regExp.hasMatch(value ?? "")
                          ? null
                          : "No es un correo valido";
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Contraseña :",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),

                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    autocorrect: false,
                    obscureText: _ispassword,
                    keyboardType: TextInputType.text,
                    decoration: _buildDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          _viewpassword();
                        },
                        child: Icon(_ispassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    onChanged: (value) => passwordController.text = value,
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
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.red,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      // isChecked = value!;
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Text("He leido y acepto los"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text("Terminos y condiciones"))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue.withOpacity(0.5),
                height: 50,
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blue,
                  onPressed: isChecked
                      ? () async {
                          // Login(_emailController.text, _passwordController.text);
                          final String? errorMessage =
                              await authService.crearUsuario(
                            emailController.text,
                            passwordController.text,
                          );

                          if (errorMessage == null) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, '/signin');
                          }
                        }
                      : null,
                  child: const Text(
                    'COMPLETADO',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(5),
  );
}
