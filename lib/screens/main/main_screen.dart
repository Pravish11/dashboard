import 'package:dashboard/controllers/MenuController.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/screens/main/components/side_menu.dart';
import 'package:dashboard/screens/main/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                  // default flex = 1
                  // and its takes 1/6 part of the screen
                  child: SideMenu()),
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: DashboardScreen())
          ],
        ),
      ),
    );
  }
}
