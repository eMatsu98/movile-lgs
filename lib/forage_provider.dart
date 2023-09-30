import 'package:flutter/material.dart';

class ForageProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool get getCheck => _isChecked;
  final List<Map<String, String>> _listForage = [];
  List<Map<String, String>> get getForageList => _listForage;

  void click() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  void saveData (String name, String location, String notes) {
    _listForage.add(Map<String,String>.from({"name":name,"location":location,"check":_isChecked?"Currently in season":"Currently not in season","notes":notes}));
    notifyListeners();
  }

  void reset () {
    _isChecked = false;
    notifyListeners();
  }
}