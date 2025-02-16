import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/depense_provider.dart';
import '../models/depense.dart';

class DepenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final depenses = Provider.of<DepenseProvider>(context).depenses;

    return ListView.builder(
      itemCount: depenses.length,
      itemBuilder: (ctx, index) {
        final depense = depenses[index];
        return Card(
          child: ListTile(
            title: Text(depense.titre),
            subtitle: Text('${depense.categorie} - ${depense.date.toString()}'),
            trailing: Text('\$${depense.montant.toStringAsFixed(2)}'),
            onTap: () {
              // Optionnel: Ajouter une fonction pour éditer ou supprimer une dépense
            },
          ),
        );
      },
    );
  }
}