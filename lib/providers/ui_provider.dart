import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _bnbindex = 0;

  int get bnbIndex => _bnbindex;

  set bnbIndex(int i) {
    _bnbindex = i;
    notifyListeners();
  }
}
