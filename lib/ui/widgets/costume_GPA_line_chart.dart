import 'package:flutter/material.dart';
import 'package:sion_inter/model/model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CostumeGPALineCharts extends StatelessWidget {
  final List<GPA> listOfGPA;
  const CostumeGPALineCharts({Key? key, required this.listOfGPA})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <ChartSeries>[
        LineSeries<GPAS, double>(
            dataSource: getChartData(),
            xValueMapper: (GPAS gpa, _) => gpa.semester,
            yValueMapper: (GPAS gpa, _) => gpa.ip)
      ],
    );
  }

  List<GPAS> getChartData() {
    var counter = 0.0;
    var list = listOfGPA.map((e) {
      return GPAS(ip: (double.parse(e.ipSemester!)), semester: counter += 1);
    }).toList();
    return list;
  }
}

class GPAS {
  double semester;
  double ip;
  GPAS({required this.ip, required this.semester});
}
