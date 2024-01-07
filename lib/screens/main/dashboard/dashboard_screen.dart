import 'package:dashboard/constants.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/screens/main/dashboard/components/header.dart';
import 'package:dashboard/screens/main/dashboard/components/my_files.dart';
import 'package:dashboard/screens/main/dashboard/components/recent_files.dart';
import 'package:dashboard/screens/main/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartSelection = [
      PieChartSectionData(
          value: 25, color: primaryColor, showTitle: false, radius: 25),
      PieChartSectionData(
          value: 20,
          color: const Color(0xFF26E5FF),
          showTitle: false,
          radius: 22),
      PieChartSectionData(
          value: 10,
          color: const Color(0xFFFFCF26),
          showTitle: false,
          radius: 19),
      PieChartSectionData(
          value: 15,
          color: const Color(0xFFEE2727),
          showTitle: false,
          radius: 16),
      PieChartSectionData(
          value: 25,
          color: primaryColor.withOpacity(0.1),
          showTitle: false,
          radius: 13),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        RecentFiles(),
                        if (Responsive.isMobile(context))
                          const SizedBox(
                            height: defaultPadding,
                          ),
                        if (Responsive.isMobile(context))
                          StorageDetails(pieChartSelection: pieChartSelection)
                      ],
                    )),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context))
                  Expanded(
                      flex: 2,
                      child:
                          StorageDetails(pieChartSelection: pieChartSelection))
              ],
            )
          ],
        ),
      ),
    );
  }
}
