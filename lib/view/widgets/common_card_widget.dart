import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      padding: const EdgeInsets.all(12),
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
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  // color: AppColor.greyColor
                ),
              ),
              Text(
                amount.toString(),
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
