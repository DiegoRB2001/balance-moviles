import 'package:flutter/material.dart';
import 'package:balance/utils/constants.dart';

class FrontSheet extends StatelessWidget {
  const FrontSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final _list = List.generate(
        10,
        (index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorDark))));

    return Container(
        height: 800,
        decoration: Constants.sheetBoxDecoration(
            Theme.of(context).scaffoldBackgroundColor),
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: _list));
  }
}
