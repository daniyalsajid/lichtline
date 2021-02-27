import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lichtline/models/input_comparison_model.dart';

class DataProvider extends ChangeNotifier {
  int _month = 12;
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

  calculateEnergyCosting(List<InputModel> _valuesForCalculation) {
    int _stuck = int.parse(_valuesForCalculation[2].value);
    int _watt = int.parse(_valuesForCalculation[3].value);
    int _hours = int.parse(_valuesForCalculation[0].value);
    int _totalHours = int.parse(_valuesForCalculation[6].value);
    int _days = int.parse(_valuesForCalculation[1].value);
    int hoursToYearsForMaintenancePrice =
        ((_totalHours / _days) / _hours).round();
    List _totalEnergyCosting = [];
    for (int i = 0; i <= _year; i++) {
      double _tempCalValue;
      if (i != 0) {
        _tempCalValue = _month *
            _days *
            _stuck *
            (_watt / 1000) *
            _electricityCostEuroKWH *
            (1 + pow((hoursToYearsForMaintenancePrice / 100), i));
        if (i == 1) {
          _totalEnergyCosting.add(
            double.parse(
              _tempCalValue.toStringAsFixed(2),
            ),
          );
        } else {
          int currentIndex = i;
          double _newSubtractValue =
              _totalEnergyCosting[currentIndex - 2] - _tempCalValue;
          double _newValueForNextYear =
              _newSubtractValue + _totalEnergyCosting[0];
          _totalEnergyCosting
              .add(double.parse(_newValueForNextYear.toStringAsFixed(2)));
        }
      }
    }
    print("Energy Costing: " + _totalEnergyCosting.toString());
    return _totalEnergyCosting;
  }

  totalCosting(List<InputModel> _valuesForCalculation) {
    List _totalCosting = [];
    int _stuck = int.parse(_valuesForCalculation[2].value);
    int _maintenanceP = int.parse(_valuesForCalculation[5].value);

    var _totalEnergy = calculateEnergyCosting(_valuesForCalculation);
    for (var i = 0; i < _totalEnergy.length; i++) {
      if (i == 0) {
        _totalCosting.add(_totalEnergy[i]);
      } else {
        int remainder = i % 2;
        if (remainder == 0) {
          _totalCosting.add(_totalCosting[i - 1] +
              _totalEnergy[i + 1] +
              _stuck * _maintenanceP);
        } else {
          _totalCosting.add(_totalCosting[i - 1] + _totalEnergy[i]);
        }
      }
    }
    print(_totalCosting);
  }

  totalCarbonDioxide(List<InputModel> _valuesForCalculation) {
    int _hours = int.parse(_valuesForCalculation[0].value);
    int _days = int.parse(_valuesForCalculation[1].value);
    int _stuck = int.parse(_valuesForCalculation[2].value);
    int _watt = int.parse(_valuesForCalculation[3].value);
    List _totalCo2 = [];
    for (int i = 1; i <= _year; i++) {
      double tempCal =
          (_hours * _days * _stuck * (_watt / 10000) * (486 / 100000)) * i;
      _totalCo2.add(tempCal);
    }
    print("CO2: " + _totalCo2.toString());
  }

  totalKw(List<InputModel> _valuesForCalculation) {
    int _hours = int.parse(_valuesForCalculation[0].value);
    int _days = int.parse(_valuesForCalculation[1].value);
    int _stuck = int.parse(_valuesForCalculation[2].value);
    int _watt = int.parse(_valuesForCalculation[3].value);
    List _totalKw = [];
    for (int i = 1; i <= _year; i++) {
      double tempCal = (_hours * _days * _stuck * (_watt / 1000)) * i;
      _totalKw.add(tempCal);
    }
    print("KW: " + _totalKw.toString());
  }
}
