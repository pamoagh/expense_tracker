import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Map<String, dynamic>> _expenses = [];

  void _addExpense() {
    setState(() {
      _expenses.add({"title": "Dépense ${_expenses.length + 1}", "amount": (10 + _expenses.length) * 100});
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dépenses")),
      body: _expenses.isEmpty
          ? Center(child: Text("Aucune dépense enregistrée"))
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.money, color: Colors.green),
                  title: Text(_expenses[index]["title"]),
                  subtitle: Text("${_expenses[index]["amount"]} FCFA"),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}
