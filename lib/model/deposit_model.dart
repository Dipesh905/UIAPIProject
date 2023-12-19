import 'package:flutter/material.dart';

class DepositModel {
  final int amount;
  final String bankName;
  final Color depositSuccessColor;
  final Color? listTileCardColor;

  DepositModel(
      {required this.amount,
      required this.bankName,
      required this.depositSuccessColor,
      this.listTileCardColor});
}
