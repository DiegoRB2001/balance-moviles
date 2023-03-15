import 'package:flutter/material.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    _headers(String name, String cantidad) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 5),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1.5,
                  color: Theme.of(context).cardColor),
            ),
          ),
          Text(
            cantidad,
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.5,
                color: Theme.of(context).cardColor),
          )
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _headers('Ingresos', '\$ 3,500.00'),
        VerticalDivider(
          thickness: 2,
        ),
        _headers('Gastos', '\$ 1,250.00')
      ],
    );
  }
}
