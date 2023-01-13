
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/postlogin-register/editarperfil.dart';
import 'package:team9_ud3_project/providers/logearse_providers.dart';

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

  //--Colores :3--
  var colorbienverde = const Color.fromARGB(255, 111, 194, 127);
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/login/login_logo.png',
                        width: MediaQuery.of(context).size.width * 0.245,
                        // fit: BoxFit.fill,
                        // isAntiAlias: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.19,
              ),
              Column(
                children: [
                  Text(
                    "¡BIENVENIDO!",
                    style: GoogleFonts.quicksand(
                        fontSize: 22.5, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Estamos listos para cuidar de tu salud",
                    style: GoogleFonts.quicksand(
                        fontSize: 14.043, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/login/login_corazon.png',
                    scale: 7,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Stack(
                children: [
                  Container(
                    height: 225,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [colorbienceleste, colorbienverde])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 205,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              "Correo Electrónico ",
                              style: GoogleFonts.quicksand(
                                  fontSize: 13.001,
                                  fontWeight: FontWeight.w600,
                                  height: 1.9,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 37,
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    fontSize: 13.001,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: _buildDecoration(
                                    hintText: "dev@flutter.com",
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
                                    )),
                                onChanged: (value) =>
                                    _emailController.text = value,
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
                            const Spacer(),
                            Text(
                              "Contraseña :",
                              style: GoogleFonts.quicksand(
                                  fontSize: 13.001,
                                  fontWeight: FontWeight.w500,
                                  height: 1.9,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 37,
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    fontSize: 13.001,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                autocorrect: false,
                                obscureText: _ispassword,
                                keyboardType: TextInputType.text,
                                decoration: _buildDecoration(
                                  hintText: "·········",
                                  prefixIcon: const Icon(
                                    Icons.key_outlined,
                                    color: Colors.grey,
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
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                            // TextFormField(
                            //   controller: _emailController,
                            // ),
                            // smallGap,
                            // TextFormField(
                            //   controller: _passwordController,
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.37,
                                  height: 35,
                                  child: MaterialButton(
                                    elevation: 0,
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
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditarPerfilInicial()),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'INICIAR SESIÓN',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 9.3,
                                          fontWeight: FontWeight.w800,
                                          color: colorbienverde),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.37,
                                  height: 35,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      side: const BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                    child: Text(
                                      'REGISTRARSE',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 9.3,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/login/logingux.png',
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.3245,
                            child: Center(
                              child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.width *
                                        0.23,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    viewportFraction: 0.9,
                                  ),
                                  items: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.transparent),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "¡Hola!",
                                            style: GoogleFonts.quicksand(
                                                fontSize: 16.5,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Me llamo Gux, y me siento alegre de recibir tu visita !",
                                            style: GoogleFonts.quicksand(
                                                fontSize: 10.5,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.transparent),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.015,
                                          ),
                                          Stack(
                                            children: [
                                              Text(
                                                "Inicie sesión para comenzar, si no tiene una cuenta, presione aquí para registrarte.",
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 10.5,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              MaterialButton(
                                                minWidth: MediaQuery.of(context).size.width,
                                                height: MediaQuery.of(context).size.width*0.17,
                                                onPressed: (() {
                                                  Navigator.pushNamed(
                                                      context, '/signup');
                                                }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
    // enabledBorder: OutlineInputBorder(
    //   // borderSide: const BorderSide(width: 2, color: Colors.green),
    //   borderRadius: BorderRadius.circular(15),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   // borderSide: const BorderSide(width: 2, color: Colors.green),
    //   borderRadius: BorderRadius.circular(15),
    // ),
    // errorBorder: OutlineInputBorder(
    //   // borderSide: const BorderSide(width: 2, color: Colors.green),
    //   borderRadius: BorderRadius.circular(15),
    // ),
    // border: OutlineInputBorder(
    //   // borderSide: const BorderSide(width: 2, color: Colors.green),
    //   borderRadius: BorderRadius.circular(15),
    // ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.quicksand(
      fontSize: 13.001,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(0),
  );
}
