import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team9_ud3_project/providers/usuarios_provides.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

final fechaController = TextEditingController();
final pesoController = TextEditingController();

class GraficoPage extends StatefulWidget {
  const GraficoPage({super.key});

  @override
  State<GraficoPage> createState() => _GraficoPageState();
}

class _GraficoPageState extends State<GraficoPage> {
  late List<SalesDData> _Data1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Data1 = getDatos();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(children: [
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
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                              "HISTORIAL",
                              style: GoogleFonts.quicksand(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(20, 0, 35, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: TextField(
                            controller: pesoController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 81, 181, 251)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(15),
                              hintText: "Peso",
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: TextField(
                          controller: fechaController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 0, 170, 255)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.all(15),
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            hintText: "Año",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                          onTap: () async {
                            DateTime? pickeDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));
                            print(fechaController);
                            if (pickeDate != null) {
                              setState(() {
                                fechaController.text =
                                    DateFormat.yMd().format(pickeDate);
                                print(fechaController.text);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    minWidth: 100,
                    height: 40,
                    color: const Color.fromARGB(255, 51, 198, 244),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      //   double.parse(fechaController.text),
                      // double.parse(pesoController.text);
                      final datosfecha = fechaController.text;

                      final year = datosfecha.split('/');
                      final anio = int.parse(year[2]);
                      final month = datosfecha.split('/');
                      print('DEMO ------- ${month[1]}');
                      final mes = int.parse(month[1]);

                      //final DateTime fecha = int.parse(datosfecha);
                      _Data1.add(SalesDData(DateTime(anio, mes),
                          double.parse(pesoController.text)));
                      //print(fecha);

                      print(datosfecha);
                    },
                    child: Text(
                      'AÑADIR',
                      style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.82,
              child: SfCartesianChart(
                primaryXAxis: DateTimeCategoryAxis(
                  dateFormat: DateFormat.yMd(),
                ),
                // title: ChartTitle(text: 'Peso (Kg)'),
                legend: Legend(isVisible: true),
                series: [
                  /*SplineSeries<DatosGrafico, double>(
                      dataSource: _Datos,
                      xValueMapper: (DatosGrafico sales, _) =>
                          double.parse(sales.fechas),
                      yValueMapper: (DatosGrafico sales, _) => sales.pesos,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: Colors.red,
                      width: 2.5,
                      opacity: 0.5,
                      cardinalSplineTension: 0.9),*/
                  //Linea Curva
                  SplineSeries<SalesDData, DateTime>(
                    dataSource: _Data1,
                    xValueMapper: (SalesDData sales, _) => sales.fecha,
                    yValueMapper: (SalesDData sales, _) => sales.peso,
                    color: Colors.red,
                    width: 2.5,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    opacity: 0.5,
                    name: 'Peso',
                  ),
                  // FastLineSeries<SalesDData, DateTime>(
                  //     dataSource: _Data,
                  //     xValueMapper: (SalesDData sales, _) => sales.fecha,
                  //     yValueMapper: (SalesDData sales, _) => sales.peso,
                  //     color: Colors.black,
                  //     width: 2.5,
                  //     opacity: 0.5,
                  //     name: 'Objetivo',
                  //     dashArray: [5.6]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

List<SalesDData> getDatos() {
  List<SalesDData> data = [
    SalesDData(DateTime(2023, 1, 4), 68),
    SalesDData(DateTime(2023, 5), 70),
  ];

  return data;
}

class SalesDData {
  SalesDData(this.fecha, this.peso);
  final DateTime fecha;
  final double peso;
}
