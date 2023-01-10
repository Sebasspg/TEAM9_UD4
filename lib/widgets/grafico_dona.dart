import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:team9_ud3_project/providers/peso_provider.dart';

class DonaWidget extends StatelessWidget {
  DonaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    final List<_ChartData> data = [
      _ChartData('Calorias', pesosProvider.calorias),
      _ChartData('Carbohidratos', pesosProvider.carbohidratos),
      _ChartData('Grasas', pesosProvider.grasas),
      _ChartData('Proteinas', pesosProvider.proteinas),
    ];

    return SfCircularChart(
        palette: [Colors.yellow, Colors.blue, Colors.red, Colors.green],
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: TextStyle(fontSize: 15, color: Colors.black)),
        series: [
          DoughnutSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            innerRadius: '45%',
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
            legendIconType: LegendIconType.circle,
          ),
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
