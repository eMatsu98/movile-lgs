import 'package:flutter/material.dart';

class TipProvider extends ChangeNotifier {
  double costOfService = 0.0;
  double selectedOption = 0.0;
  bool roundUpTip = false;
  double totalTip = 0.0;

  void updateCostOfService(double cost) {
    costOfService = cost;
    calculateTip();
    notifyListeners();
  }

  void updateSelectedOption(double option) {
    selectedOption = option;
    calculateTip();
    notifyListeners();
  }

  void updateRoundUpTip(bool roundUp) {
    roundUpTip = roundUp;
    calculateTip();
    notifyListeners();
  }
  
  void calculateTip() {
    double tipAmount = costOfService * (selectedOption / 100);
    if (roundUpTip) {
      tipAmount = tipAmount.ceilToDouble();
    }
    totalTip = double.parse(tipAmount.toStringAsFixed(2));
  }
}
