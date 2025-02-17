import 'package:flutter/material.dart';
import 'pie_chart.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PieChartWidget(),
      ),
    );
  }
}