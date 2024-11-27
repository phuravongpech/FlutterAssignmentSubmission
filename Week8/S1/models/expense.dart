import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
}

enum ExpenseType {
  food(icon: Icons.food_bank),
  travel(icon: Icons.travel_explore),
  leisure(icon: Icons.golf_course),
  work(icon: Icons.work);

  final IconData icon;

  const ExpenseType({required this.icon});
}
