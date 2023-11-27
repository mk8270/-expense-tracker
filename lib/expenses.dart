import 'package:expense_tracker/new_expenses.dart';
import 'package:expense_tracker/widgets/expenseslist.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      Gategory.work,
      title: 'Udemey Crouse',
      amount: 12.0,
      time: DateTime.now(),
    ),
    Expense(
      Gategory.travel,
      title: 'Trichy',
      amount: 8.0,
      time: DateTime.now(),
    )
  ];

  void addexpense(Expense expemse) {
    setState(() {
      _registeredExpense.add(expemse);
    });
  }

  void bottomShetts() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addexpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
        actions: [
          IconButton(
            onPressed: bottomShetts,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
