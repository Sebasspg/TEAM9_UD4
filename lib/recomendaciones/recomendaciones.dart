import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recomendaciones extends StatefulWidget {
  const Recomendaciones({super.key});

  @override
  State<Recomendaciones> createState() => _RecomendacionesState();
}

class _RecomendacionesState extends State<Recomendaciones> {
  List<int> items = List<int>.generate(1, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                                      'assets/login/login_logo.png'),
                                  onPressed: () {
                                    Navigator.pop(
                                      (context),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Text(
                              "RECOMENDACIONES",
                              style: GoogleFonts.quicksand(
                                  fontSize: 11.965,
                                  fontWeight: FontWeight.w800),
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
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Column(
              children: [
                Text(
                  "Te Recomendamos",
                  style: GoogleFonts.quicksand(
                      fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(
                    color: const Color.fromARGB(255, 134, 223, 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('IGNORAR :,3'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.check_circle_outline),
                      ],
                    ),
                  ),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 130,
                        color: Colors.lightGreen,
                        child: const Center(
                          child: ListTile(
                            title: Text('TÌTULO DE LA RECOMENDACIÓN'),
                            subtitle: Text('TEXTITO DE DESCRIPCIÓN :3'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: true,
    //     title: const Text('RECOMENDACIONES'),
    //     toolbarHeight: 60,
    //   ),
    //   body: ListView.builder(
    //     itemCount: items.length,
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     itemBuilder: (BuildContext context, int index) {
    //       return Dismissible(
    //         background: Container(
    //           color: const Color.fromARGB(255, 134, 223, 70),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: const[
    //               Text('IGNORAR :,3'),
    //               SizedBox(width: 10,),
    //               Icon(Icons.check_circle_outline),
    //             ],
    //           ),
    //         ),
    //         key: ValueKey<int>(items[index]),
    //         onDismissed: (DismissDirection direction) {
    //           setState(() {
    //             items.removeAt(index);
    //           });
    //         },
    //         child: Column(
    //           children: [
    //             const SizedBox(height: 5,),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 10),
    //               child: Container(
    //                 height: 130,
    //                 color: Colors.lightGreen,
    //                 child: const Center(
    //                   child: ListTile(
    //                     title: Text('TÌTULO DE LA RECOMENDACIÓN'),
    //                     subtitle: Text('TEXTITO DE DESCRIPCIÓN :3'),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 5,),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
