import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Text(
            expense.title,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                '\$${expense.amount.toStringAsFixed(2)}',
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(gategoryIcons[expense.gategory]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    expense.formatDate,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
