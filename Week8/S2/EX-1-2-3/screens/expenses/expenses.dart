import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  double sum = 1000;

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  //uses id to remove the object,
  void onExpenseRemoved(Expense expense) {
    final expenseIndex =
        _registeredExpenses.indexWhere((e) => e.id == expense.id);

    //check if its valid index, to prevent runtime exception
    if (expenseIndex != -1) {
      setState(() {
        _registeredExpenses.removeAt(expenseIndex);
      });
    }

    deductSum(expense.amount);
  }

  void deductSum(double amount) {
    sum = sum - amount;
  }

  void addSum(double amount) {
    sum = sum + amount;
  }

  void restoreExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
    addSum(newExpense.amount);
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddPressed,
            )
          ],
          backgroundColor: Colors.blue[700],
          title: Text('Ronan-The-Best Expenses $sum'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const ExpenseSum(),
            Expanded(
              child: _registeredExpenses.isEmpty
                  ? const Center(
                      child: Text('empty list, please add expense!!'),
                    )
                  : ExpensesList(
                      expenses: _registeredExpenses,
                      onExpenseRemoved: onExpenseRemoved,
                      onRestoreExpense: restoreExpense,
                    ),
            )
          ],
        ));
  }
}

class ExpenseSum extends StatelessWidget {
  const ExpenseSum({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...Category.values.map((c) => Column(
              children: [Text(c.name), Icon(c.icon)],
            ))
      ],
    );
  }
}
