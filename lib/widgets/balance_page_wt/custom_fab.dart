import 'package:balance/pages/add_entries.dart';
import 'package:balance/pages/add_expenses.dart';
import 'package:balance/widgets/balance_page_wt/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> botones = [];

    //Gastos
    botones.add(SpeedDialChild(
      backgroundColor: Colors.redAccent,
      child: const Icon(Icons.remove),
      label: 'Gasto',
      labelStyle: const TextStyle(fontSize: 18),
      onTap: () {
        Navigator.push(
          context,
          // animacion(context, 700, Curves.easeInOutBack, const Alignment(0.8, 1),
          //     const AddEntries()),
          CustomAnimation(
              pagina: const AddExpenses(),
              animacion: Curves.easeInOutBack,
              milisegundos: 700,
              alineacion: const Alignment(0.8, 1)),
        );
      },
    ));

    //Ingresos
    botones.add(SpeedDialChild(
      backgroundColor: Colors.greenAccent,
      child: const Icon(Icons.add),
      label: 'Ingreso',
      labelStyle: const TextStyle(fontSize: 18),
      onTap: () {
        Navigator.push(
          context,
          // animacion(context, 700, Curves.decelerate, const Alignment(-0.8, 1),
          //     const AddExpenses()),
          CustomAnimation(
              pagina: const AddEntries(),
              milisegundos: 700,
              animacion: Curves.decelerate,
              alineacion: const Alignment(-0.8, 1)),
        );
      },
    ));

    return SpeedDial(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      childMargin: const EdgeInsets.symmetric(horizontal: 5),
      childrenButtonSize: const Size(60, 60),
      icon: Icons.add,
      activeIcon: Icons.close,
      children: botones,
    );
  }
}

// PageRouteBuilder animacion(BuildContext context, int milisegundos,
//     Curve animacion, Alignment alineacion, Widget pagina) {
//   return PageRouteBuilder(
//     transitionDuration: Duration(milliseconds: milisegundos),
//     transitionsBuilder: (BuildContext context, Animation<double> animation,
//         Animation<double> secAnimation, Widget child) {
//       animation = CurvedAnimation(
//         parent: animation,
//         curve: animacion,
//       );
//       return ScaleTransition(
//         alignment: alineacion,
//         scale: animation,
//         child: child,
//       );
//     },
//     pageBuilder: (BuildContext context, Animation<double> animation,
//         Animation<double> secAnimation) {
//       return pagina;
//     },
//   );
// }