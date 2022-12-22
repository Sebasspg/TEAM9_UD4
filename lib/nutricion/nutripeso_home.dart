import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutriPage extends StatefulWidget {
  const NutriPage({super.key});

  @override
  State<NutriPage> createState() => _NutriPageState();
}

class _NutriPageState extends State<NutriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Nutricional'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          /*
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    width: 120,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    width: 120,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
          ),*/

          SizedBox(
            height: 10,
          ),
          Text(
            'Control de Peso',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          /*
          Text(
            'Ultimo peso:',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 16),
          ),*/
          Text(
            'Categoria : Sobrepeso',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none, icon: Icon(Icons.balance)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                height: 60,
                minWidth: 70,
                color: Colors.lightBlue,
                onPressed: () {},
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Calculadora Alimenticia',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          Text(
            'Seleccione una comida para calcularla',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 55, // Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg'),
                      ),
                      Text(
                        '09:00',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      Text(
                        'Desayuno',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 55, // Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg'),
                      ),
                      Text(
                        '13:00',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      Text(
                        'Almuerzo',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 55, // Image radius
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg'),
                      ),
                      Text(
                        '20:00',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      Text(
                        'Cena',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.56,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 2.25 / 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Calorias',
                          style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 22, 73, 114),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: SizedBox(
                                width: 100,
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/390/390933.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 60),
                            child: Column(
                              children: [
                                Text(
                                  '0/1841',
                                  style: GoogleFonts.montserrat(
                                      color: Color.fromARGB(255, 22, 73, 114),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  'Calorias',
                                  style: GoogleFonts.montserrat(
                                      color: Color.fromARGB(255, 22, 73, 114),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Carbohidratos',
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 22, 73, 114),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/390/390933.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 60),
                          child: Column(
                            children: [
                              Text(
                                '0/261',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                'gramos',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Grasas',
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 22, 73, 114),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/390/390933.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 60),
                          child: Column(
                            children: [
                              Text(
                                '0/261',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                'gramos',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Proteinas',
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 22, 73, 114),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/390/390933.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 60),
                          child: Column(
                            children: [
                              Text(
                                '0/261',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                'gramos',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 22, 73, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
