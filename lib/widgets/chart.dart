import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/depense_provider.dart';
import '../models/depense.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final depenses = Provider.of<DepenseProvider>(context).depenses;

    // Calcul des dépenses par catégorie
    Map<String, double> depensesParCategorie = {
      'Alimentation': 0,
      'Logement': 0,
      'Loisirs': 0,
      'Transport': 0,
    };

    depenses.forEach((depense) {
      depensesParCategorie[depense.categorie] =
          depensesParCategorie[depense.categorie]! + depense.montant;
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: depensesParCategorie.entries.map((entry) {
            return Column(
              children: [
                Text(entry.key),
                Text('\$${entry.value.toStringAsFixed(2)}'),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}