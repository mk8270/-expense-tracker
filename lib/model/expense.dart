import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Gategory { travel, food, work, leisur }

class Expense {
  Expense(this.category,
      {required this.title, required this.amount, required this.time})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime time;
  final Gategory category;
}
