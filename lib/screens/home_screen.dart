import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import '../widgets/depense_list.dart';
import 'add_depense_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi des Dépenses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddDepenseScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(),
          Expanded(
            child: DepenseList(),
          ),
        ],
      ),
    );
  }
}