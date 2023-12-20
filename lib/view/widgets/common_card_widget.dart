import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uiapiapp/controller/resources/colors.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget({
    required this.title,
    required this.amount,
    required this.cardColor,
    required this.iconData,
    super.key,
  });

  final IconData iconData;

  final TextStyle textStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  final String title;
  final double amount;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    final value = NumberFormat("#,##0.00", "en_US");

    return Container(
      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundColor: AppColor.whiteColor,
              radius: 24,
              child: Center(
                child: Icon(iconData),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textStyle.copyWith(
                  color: AppColor.lightGreyTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                value.format(double.parse('$amount')),
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
