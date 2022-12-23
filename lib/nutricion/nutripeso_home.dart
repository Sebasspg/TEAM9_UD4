import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';

final edad_Controller = TextEditingController();
final altura_Controller = TextEditingController();
final peso_Controller = TextEditingController();

class NutriPage extends StatefulWidget {
  const NutriPage({super.key});

  @override
  State<NutriPage> createState() => _NutriPageState();
}

class _NutriPageState extends State<NutriPage> {
  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Nutricional'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Control de Peso',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Categoria : ${pesosProvider.msg}',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              (pesosProvider.msg == 'Normal')
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 50,
                    )
                  : (pesosProvider.msg == 'Sobrepeso')
                      ? Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                          size: 50,
                        )
                      : (pesosProvider.msg == 'Bajo')
                          ? Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.amber,
                              size: 50,
                            )
                          : (pesosProvider.msg == 'Obesidad I')
                              ? Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                  size: 50,
                                )
                              : (pesosProvider.msg == 'Obesidad II')
                                  ? Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                      size: 50,
                                    )
                                  : (pesosProvider.msg == 'Obesidad III')
                                      ? Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red,
                                          size: 50,
                                        )
                                      : Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.white,
                                          size: 1,
                                        ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                        controller: edad_Controller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            hintText: 'Edad',
                            border: InputBorder.none,
                            icon: Icon(Icons.numbers)),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: peso_Controller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            hintText: 'Peso',
                            border: InputBorder.none,
                            icon: Icon(Icons.balance)),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: altura_Controller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            hintText: 'Altura 0.0',
                            border: InputBorder.none,
                            icon: Icon(Icons.run_circle_outlined)),
                      ),
                    ),
                  ),
                ],
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
                onPressed: () {
                  pesosProvider.getCalorias(int.parse(edad_Controller.text));
                  pesosProvider.getCategoriaxIMC(
                      int.parse(peso_Controller.text),
                      double.parse(altura_Controller.text));
                  pesosProvider.getProteinas(int.parse(peso_Controller.text));
                  pesosProvider
                      .getCarbohidratos(int.parse(peso_Controller.text));
                },
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
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider
                          .getCalorias(int.parse(edad_Controller.text));
                    },
                    child: Column(
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
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider.getCaloriasxAlmuerzo(
                          int.parse(edad_Controller.text));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55, // Image radius
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/09/12/21/47/noodles-2743779_960_720.jpg'),
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
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      pesosProvider
                          .getCaloriasxCena(int.parse(edad_Controller.text));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55, // Image radius
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2014/09/11/11/17/prawn-441623_960_720.jpg'),
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
            height: MediaQuery.of(context).size.height * 0.58,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 2.25 / 2.8,
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
                                horizontal: 65, vertical: 65),
                            child: Column(
                              children: [
                                Text(
                                  '${pesosProvider.calorias}',
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
                              horizontal: 65, vertical: 65),
                          child: Column(
                            children: [
                              Text(
                                '${pesosProvider.carbohidratos}',
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
                              horizontal: 65, vertical: 65),
                          child: Column(
                            children: [
                              Text(
                                '${pesosProvider.grasas}',
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
                              horizontal: 65, vertical: 65),
                          child: Column(
                            children: [
                              Text(
                                '${pesosProvider.proteinas}',
                                textAlign: TextAlign.center,
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
