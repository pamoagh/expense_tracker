import 'package:hive/hive.dart';

part 'depense.g.dart'; // Fichier généré par Hive

@HiveType(typeId: 0)
class Depense {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String titre;

  @HiveField(2)
  final double montant;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String categorie;

  Depense({
    required this.id,
    required this.titre,
    required this.montant,
    required this.date,
    required this.categorie,
  });
}