import 'package:flutter/material.dart';

class BMIResultProvider with ChangeNotifier {
  String _bmiResult = '';

  String get bmiResult => _bmiResult;

  void setBMIResult(String result) {
    _bmiResult = result;
    notifyListeners();
  }
}
