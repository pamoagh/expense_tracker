import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/depense_provider.dart';
import 'package:intl/intl.dart';

class DepenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final depenses = Provider.of<DepenseProvider>(context).depenses;

    return ListView.builder(
      itemCount: depenses.length,
      itemBuilder: (ctx, index) {
        final depense = depenses[index];
        return Dismissible(
          key: ValueKey(depense.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            Provider.of<DepenseProvider>(context, listen: false)
                .removeDepense(depense.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Dépense supprimée !')),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(depense.titre),
              subtitle: Text('${depense.categorie} - ${DateFormat.yMd().format(depense.date)}'),
              trailing: Text('\$${depense.montant.toStringAsFixed(2)}'),
            ),
          ),
        );
      },
    );
  }
}