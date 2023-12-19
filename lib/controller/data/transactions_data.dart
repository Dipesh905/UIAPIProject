import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/model/transaction_model.dart';

List<TransactionModel> transactions = [
  TransactionModel(
      title: 'Total Deposit',
      amount: 22534.05,
      color: AppColor.lightPinkColor,
      icon: Icons.add),
  TransactionModel(
      title: 'Total Withdrawal',
      amount: 22534.05,
      color: AppColor.lightBlueColor,
      icon: Icons.remove),
  TransactionModel(
      title: 'title',
      amount: 331.32,
      color: AppColor.lightPurpleColor,
      icon: Icons.abc)
];
