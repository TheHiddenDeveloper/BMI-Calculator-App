import 'package:flutter/material.dart';
import '../models/bmi_record.dart';

class BmiProvider with ChangeNotifier {
  double _bmi = 0.0;
  String _category = '';
  final List<BmiRecord> _history = [];

  double get bmi => _bmi;
  String get category => _category;
  List<BmiRecord> get history => _history;

  void calculateBmi(double height, double weight, bool isMetric) {
    if (isMetric) {
      height = height / 100; // convert cm to meters
      _bmi = weight / (height * height);
    } else {
      _bmi = (weight * 703) /
          (height * height); // height in inches and weight in pounds
    }
    _setCategory();
    _history
        .add(BmiRecord(date: DateTime.now(), bmi: _bmi, category: _category));
    notifyListeners();
  }

  void _setCategory() {
    if (_bmi < 18.5) {
      _category = 'Underweight';
    } else if (_bmi < 24.9) {
      _category = 'Healthy weight';
    } else if (_bmi < 29.9) {
      _category = 'Overweight';
    } else {
      _category = 'Obese';
    }
  }
}
