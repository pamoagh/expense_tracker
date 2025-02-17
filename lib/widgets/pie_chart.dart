import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/depense_provider.dart';

class PieChartWidget extends StatelessWidget {
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

    // Préparer les données pour le graphique
    List<PieChartSectionData> pieChartSections = depensesParCategorie.entries.map((entry) {
      return PieChartSectionData(
        color: _getColorForCategory(entry.key),
        value: entry.value,
        title: '${entry.key}\n\$${entry.value.toStringAsFixed(2)}',
        radius: 80,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      );
    }).toList();

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: pieChartSections,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Alimentation':
        return Colors.blue;
      case 'Logement':
        return Colors.green;
      case 'Loisirs':
        return Colors.orange;
      case 'Transport':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}