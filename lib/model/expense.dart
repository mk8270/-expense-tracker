import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final format = DateFormat.yMd();
const uuid = Uuid();

enum Gategory { travel, food, work, leisur }

const gategoryIcons = {
  Gategory.food: Icons.lunch_dining,
  Gategory.travel: Icons.flight_takeoff_rounded,
  Gategory.work: Icons.work,
  Gategory.leisur: Icons.movie_sharp
};

class Expense {
  Expense(this.gategory,
      {required this.title, required this.amount, required this.time})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime time;
  final Gategory gategory;

  String get formatDate {
    return format.format(time);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.gategory, required this.expenses});

  ExpenseBucket.forSinlgeGategory(List<Expense> allExpenseList, this.gategory)
      : expenses = allExpenseList.where((element) {
          return element.gategory == gategory;
        }).toList();

  final Gategory gategory;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;
    for (final expesns in expenses) {
      sum += expesns.amount;
    }

    return sum;
  }
}
