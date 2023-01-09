import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingCustom extends StatelessWidget {
  final String textoCarga;

  const LoadingCustom({super.key, required this.textoCarga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "UN MOMENTO...",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text("Gux esta preparando todo para ti"),
            const SpinKitRing(
              color: Colors.blue,
              size: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              textoCarga,
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: Colors.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/vacunas/rg_gux_register.png',
                    scale: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
