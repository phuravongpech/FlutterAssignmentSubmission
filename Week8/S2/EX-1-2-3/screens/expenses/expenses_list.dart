import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseRemoved,
      required this.onRestoreExpense});

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onRestoreExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final Expense currentExpense = expenses[index];

          return Dismissible(
            key: ValueKey(currentExpense.id),
            background: Container(
              color: Colors.red[400],
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red[400],
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              onExpenseRemoved(currentExpense);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Expense removed'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      onRestoreExpense(currentExpense);
                    },
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            child: ExpenseItem(currentExpense),
          );
        },
      ),
    );
  }
}
