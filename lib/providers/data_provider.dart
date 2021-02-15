import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lichtline/models/input_comparison_model.dart';

class DataProvider extends ChangeNotifier {
  int _month = 12;
  int _days = 365;
  int _yearIncrementPercent = 2;
  int _year = 12;
  double _electricityCostEuroKWH = 0.18;

  List<InputModel> _lichtLine;
  List<InputModel> _altLosung;

  List<InputModel> get lichtLine => _lichtLine;
  List<InputModel> get altLosung => _altLosung;

  void setInputValues(List<InputModel> _licht, List<InputModel> _alt) {
    _lichtLine = _licht;
    _altLosung = _alt;
  }

  calculateEnergyCosting() {
    int _stuck = int.parse(_altLosung[2].value);
    int _watt = int.parse(_altLosung[3].value);
    List _totalEnergyCosting = [];
    for (int i = 0; i <= _year; i++) {
      double _tempCalValue;
      if (i != 0) {
        _tempCalValue = _month *
            _days *
            _stuck *
            (_watt / 1000) *
            _electricityCostEuroKWH *
            (1 + pow((_yearIncrementPercent / 100), i));
        if (i == 1) {
          _totalEnergyCosting
              .add(double.parse(_tempCalValue.toStringAsFixed(2)));
        } else {
          int currentIndex = i;
          double _newSubtractValue =
              _totalEnergyCosting[currentIndex - 2] - _tempCalValue;
          double _newValueForNextYear =
              _newSubtractValue + _totalEnergyCosting[currentIndex - 2];
          _totalEnergyCosting
              .add(double.parse(_newValueForNextYear.toStringAsFixed(2)));
        }
      }
    }
    print(_totalEnergyCosting);
  }

  totalCarbonDioxide() {
    int _hours = int.parse(_altLosung[0].value);
    int _days = int.parse(_altLosung[1].value);
    int _stuck = int.parse(_altLosung[2].value);
    int _watt = int.parse(_altLosung[3].value);
    List _totalCo2 = [];
    for (int i = 1; i <= _year; i++) {
      double tempCal =
          (_hours * _days * _stuck * (_watt / 10000) * (486 / 100000)) * i;
      _totalCo2.add(tempCal);
    }
    print(_totalCo2);
  }

  totalKw() {
    int _hours = int.parse(_altLosung[0].value);
    int _days = int.parse(_altLosung[1].value);
    int _stuck = int.parse(_altLosung[2].value);
    int _watt = int.parse(_altLosung[3].value);
    List _totalKw = [];
    for (int i = 1; i <= _year; i++) {
      double tempCal = (_hours * _days * _stuck * (_watt / 1000)) * i;
      _totalKw.add(tempCal);
    }
    print(_totalKw);
  }
}
