import 'package:dashboard/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.pieChartSelection,
  });

  final List<PieChartSectionData> pieChartSelection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
              sections: pieChartSelection,
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: 70)),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: defaultPadding,),
              Text(
                "29.1",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Text("of 128GB")
            ],
          ))
        ],
      ),
    );
  }
}
