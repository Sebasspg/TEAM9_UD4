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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NUTRICIÓN',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Image.asset(
              'assets/recetas/rslogo.png',
              height: 50,
              width: 110,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              child: TextField(
                  controller: pesoController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 81, 181, 251)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 149, 246, 255),
                    contentPadding: const EdgeInsets.all(15),
                    hintText: "Peso",
                    hintStyle: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                controller: fechaController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 81, 181, 251)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 149, 246, 255),
                  contentPadding: const EdgeInsets.all(15),
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.blue,
                  ),
                  hintText: "Año",
                  hintStyle: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
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
                      fechaController.text = DateFormat.yMd().format(pickeDate);
                      print(fechaController.text);
                    });
                  }
                },
              ),
            ),
            MaterialButton(
              minWidth: 100,
              height: 40,
              color: const Color.fromARGB(255, 83, 76, 175),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                _Data1.add(SalesDData(
                    DateTime(anio, mes), double.parse(pesoController.text)));
                //print(fecha);

                print(datosfecha);
              },
              child: const Text(
                'Añadir',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.82,
          child: SfCartesianChart(
            primaryXAxis: DateTimeCategoryAxis(
              dateFormat: DateFormat.yMd(),
            ),
            title: ChartTitle(text: 'Peso (Kg)'),
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
