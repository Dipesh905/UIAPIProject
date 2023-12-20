import 'package:flutter/material.dart';

class DepositModel {
  final int amount;
  final String bankName;
  final String bankImage;
  final Color depositSuccessColor;
  final Color? listTileCardColor;

  DepositModel(
      {required this.amount,
      required this.bankName,
      required this.bankImage,
      required this.depositSuccessColor,
      this.listTileCardColor});
}
