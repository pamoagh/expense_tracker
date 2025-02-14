import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi des Dépenses")),
      body: Center(child: Text("Bienvenue dans votre application de suivi des dépenses")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Dépenses"),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Statistiques"),
        ],
      ),
    );
  }
}
