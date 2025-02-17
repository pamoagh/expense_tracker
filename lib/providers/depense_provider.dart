import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/depense.dart';

class DepenseProvider with ChangeNotifier {
  late Box<Depense> _depensesBox;

  DepenseProvider() {
    _openBox();
  }

  Future<void> _openBox() async {
    _depensesBox = await Hive.openBox<Depense>('depenses');
    notifyListeners();
  }

  List<Depense> get depenses => _depensesBox.values.toList();

  void addDepense(Depense depense) {
    _depensesBox.add(depense);
    notifyListeners();
  }

  void removeDepense(String id) {
    // Trouver l'entrée dans la boîte qui correspond à l'ID
    final entry = _depensesBox.toMap().entries.firstWhere(
          (entry) => entry.value.id == id,
          orElse: () => throw 'Dépense non trouvée',
        );

    // Supprimer l'entrée en utilisant sa clé
    _depensesBox.delete(entry.key);
    notifyListeners();
  }
}
