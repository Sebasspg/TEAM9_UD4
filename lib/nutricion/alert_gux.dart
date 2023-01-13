import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
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
                              "NUTRICIÓN",
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
            SizedBox(
              
              child: (pesosProvider.msg == 'Normal')
                  ? Image.asset('assets/nutricion/ntguxbien.png', width: MediaQuery.of(context).size.width * 0.63,)
                  : (pesosProvider.msg == 'Delgadez')
                      ? Image.asset('assets/nutricion/ntguxmedio.png', width: MediaQuery.of(context).size.width * 0.8,)
                      : Image.asset('assets/nutricion/ntguxmal.png', width: MediaQuery.of(context).size.width * 0.8,),
            ),
            SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
