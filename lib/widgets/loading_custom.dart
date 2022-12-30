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
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRing(
              color: Colors.orange,
              size: 80,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              textoCarga,
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
