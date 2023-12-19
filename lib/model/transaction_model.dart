import 'package:flutter/material.dart';

class TransactionModel {
  String title;
  double amount;
  Color color;
  IconData icon;

  TransactionModel(
      {required this.title,
      required this.amount,
      required this.color,
      required this.icon});
}
