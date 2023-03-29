import 'package:balance/utils/constants.dart';
import 'package:balance/widgets/add_expenses_wt/custom_button.dart';
import 'package:flutter/material.dart';

class BSNumKeyboard extends StatefulWidget {
  const BSNumKeyboard({super.key});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';
  RegExp exp = RegExp('^\\d+(\\.\\d+)?\$');

  @override
  Widget build(BuildContext context) {
    String Function(Match) matchFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    matchFunc = (Match match) => '${match[1]},';

    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Text('Cantidad ingresada'),
            Text(
              '\$ ${importe.replaceAllMapped(reg, matchFunc)}',
              style: const TextStyle(
                  fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _numPad() {
    String temp = importe;
    _num(String _text, double _height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (importe == '0.00') importe = '';
            if (importe.contains('.')) {
              String decimal = importe.split('.')[1];
              if (_text == '.' ||
                  decimal.length == 2 ||
                  (decimal.length == 1 && _text == '0')) {
                return;
              }
            }
            if (importe == '0' && _text != '.') {
              importe = _text;
              return;
            }
            importe += _text;
          });
        },
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
        barrierColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //isDismissible: false,
        //enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              height: 900,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var _height = constraints.biggest.height / 5;
                  return Column(
                    children: [
                      Table(
                        border: TableBorder.symmetric(
                            inside: const BorderSide(
                          width: 1.1,
                        )),
                        children: [
                          TableRow(children: [
                            _num('1', _height),
                            _num('2', _height),
                            _num('3', _height),
                          ]),
                          TableRow(children: [
                            _num('4', _height),
                            _num('5', _height),
                            _num('6', _height),
                          ]),
                          TableRow(children: [
                            _num('7', _height),
                            _num('8', _height),
                            _num('9', _height),
                          ]),
                          TableRow(children: [
                            _num('.', _height),
                            _num('0', _height),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: SizedBox(
                                height: _height,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 35,
                                ),
                              ),
                              onLongPress: () {
                                setState(() {
                                  importe = '0.00';
                                });
                              },
                              onTap: () {
                                setState(() {
                                  if (importe.isNotEmpty) {
                                    importe = importe.substring(
                                        0, importe.length - 1);
                                  }
                                  if (importe.isEmpty) {
                                    importe = '0.00';
                                  }
                                });
                              },
                            ),
                          ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: const Text(
                                  "Aceptar",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                ontap: () {
                                  setState(() {
                                    if (importe.contains('.')) {
                                      List<String> split = importe.split('.');
                                      if (split[1].endsWith('0') ||
                                          split[1].isEmpty) {
                                        importe = split[0];
                                      }
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: const Text(
                                  "Cancelar",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                ontap: () {
                                  setState(() {
                                    importe = temp;
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          );
        });
  }

  Future<void> _alerta(String titulo, String cuerpo) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(cuerpo)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
