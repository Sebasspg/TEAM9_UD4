import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/login/home_page.dart';
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

  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    void alertCustom(BuildContext context) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: SizedBox(
                  height: 200,
                  child: Image.asset("assets/vacunas/rg_gux_register.png"),
                ),
                content: const Text(
                  'Por favor, revise su bandeja de entrada y verifique su correo',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("true");
                        Navigator.pop(context, '/signin');
                      },
                      child: const Text("aceptar"))
                ],
              ));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "REGISTRO",
                    style: GoogleFonts.quicksand(
                        fontSize: 19.7, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Image.asset(
                    'assets/login/registergux.png',
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Correo Electrónico ",
                    style: GoogleFonts.quicksand(
                        fontSize: 13.001,
                        fontWeight: FontWeight.w500,
                        height: 1.9,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                    child: TextFormField(
                      style: GoogleFonts.quicksand(
                          fontSize: 13.001,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Contraseña:",
                    style: GoogleFonts.quicksand(
                        fontSize: 13.001,
                        fontWeight: FontWeight.w500,
                        height: 1.9,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                    child: TextFormField(
                      style: GoogleFonts.quicksand(
                          fontSize: 13.001,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      autocorrect: false,
                      obscureText: _ispassword,
                      keyboardType: TextInputType.text,
                      // decoration: _buildDecoration(
                      //   suffixIcon: InkWell(
                      //     onTap: () {
                      //       _viewpassword();
                      //     },
                      //     child: Icon(_ispassword
                      //         ? Icons.visibility
                      //         : Icons.visibility_off),
                      //   ),
                      // ),
                      onChanged: (value) => passwordController.text = value,
                      validator: ((value) {
                        print(value);
                        return (value != null && value.length >= 8)
                            ? null
                            : "Debe tener minimo 8 caracteres";
                      }),
                    ),
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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.075,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        // isChecked = value!;
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Text(
                    "He leido y acepto los",
                    style: GoogleFonts.quicksand(
                        fontSize: 9.777, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TerminosCondiciones()),
                        );
                      },
                      child: Text(
                        "términos y condiciones",
                        style: GoogleFonts.quicksand(
                            fontSize: 9.777, fontWeight: FontWeight.w800),
                      ))
                ],
              ),
              Container(
                color: colorbienceleste.withOpacity(0.5),
                height: 45,
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: colorbienceleste,
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
                            alertCustom(context);
                            //Navigator.pop(context, '/signin');
                          }
                        }
                      : null,
                  child: Text(
                    '¡COMPLETADO!',
                    style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
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
    contentPadding: const EdgeInsets.all(0),
  );
}
