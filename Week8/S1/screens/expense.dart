// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

DateFormat format = DateFormat.yMd();

class Expenses extends StatefulWidget {
  final List<Expense> registeredExpenses = [
    Expense(
        title: 'hi',
        amount: 30,
        date: DateTime.now(),
        category: ExpenseType.food),
    Expense(
        title: 'hi',
        amount: 30,
        date: DateTime.now(),
        category: ExpenseType.leisure),
    Expense(
        title: 'hi',
        amount: 30,
        date: DateTime.now(),
        category: ExpenseType.travel),
    Expense(
        title: 'hi',
        amount: 30,
        date: DateTime.now(),
        category: ExpenseType.work),
  ];
  Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void onAdd() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Text('ah sal'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Ronan is the best'),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                  onPressed: onAdd,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Container(
            color: Colors.white,
            child: ExpensesList(
              expenses: widget.registeredExpenses,
            ),
          )),
    );
  }
}

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                expense.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('\$${expense.amount.toString()}'),
            ],
          ),
          const SizedBox(
            width: 200,
          ),
          Icon(expense.category.icon),
          const SizedBox(
            width: 20,
          ),
          Text(format.format(expense.date)),
        ],
      ),
    );
  }
}
