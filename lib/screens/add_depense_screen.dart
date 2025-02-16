import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/depense_provider.dart';
import '../models/depense.dart';

class AddDepenseScreen extends StatefulWidget {
  @override
  _AddDepenseScreenState createState() => _AddDepenseScreenState();
}

class _AddDepenseScreenState extends State<AddDepenseScreen> {
  final _titreController = TextEditingController();
  final _montantController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedCategorie = 'Alimentation';

  void _submitData() {
    final enteredTitre = _titreController.text;
    final enteredMontant = double.parse(_montantController.text);

    if (enteredTitre.isEmpty || enteredMontant <= 0 || _selectedDate == null) {
      return;
    }

    Provider.of<DepenseProvider>(context, listen: false).addDepense(
      Depense(
        id: DateTime.now().toString(),
        titre: enteredTitre,
        montant: enteredMontant,
        date: _selectedDate!,
        categorie: _selectedCategorie,
      ),
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Dépense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Titre'),
              controller: _titreController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Montant'),
              controller: _montantController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Aucune date choisie !'
                        : 'Date choisie : ${DateFormat.yMd().format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  child: Text(
                    'Choisir une date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
            DropdownButton<String>(
              value: _selectedCategorie,
              items: ['Alimentation', 'Logement', 'Loisirs', 'Transport']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategorie = newValue!;
                });
              },
            ),
            ElevatedButton(
              child: Text('Ajouter la Dépense'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}