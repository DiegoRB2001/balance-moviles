import 'package:balance/pages/balance_page.dart';
import 'package:balance/pages/charts_page.dart';
import 'package:balance/widgets/home_page_wt/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const indiceActual = 0;
    switch (indiceActual) {
      case 0:
        return BalancePage();
      case 1:
        return ChartsPage();
      default:
        return BalancePage();
    }
  }
}
