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
    
  }
}
