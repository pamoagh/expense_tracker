import 'package:flutter/material.dart';
import '../models/depense.dart';

class DepenseProvider with ChangeNotifier {
  List<Depense> _depenses = [];

  List<Depense> get depenses => _depenses;

  void addDepense(Depense depense) {
    _depenses.add(depense);
    notifyListeners();
  }

  void removeDepense(String id) {
    _depenses.removeWhere((depense) => depense.id == id);
    notifyListeners();
  }
}