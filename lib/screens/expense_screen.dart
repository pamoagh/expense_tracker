import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dépenses")),
      body: Center(child: Text("Suivi des dépenses ici")),
    );
  }
}
