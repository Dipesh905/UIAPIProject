import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/resources/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.bankName,
    required this.amount,
    required this.successColor,
    this.listTileCardColor,
    this.isTextWhite,
    super.key,
  });

  final int amount;
  final String bankName;
  final Color successColor;
  final Color? listTileCardColor;
  final bool? isTextWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: listTileCardColor ?? AppColor.lightGreyColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            child: Icon(Icons.abc),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+\$$amount',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isTextWhite == true ? AppColor.whiteColor : null),
              ),
              Text(
                'Deposit via bank $bankName ',
                style: const TextStyle(color: AppColor.greyColor),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: successColor, borderRadius: BorderRadius.circular(15)),
            child: Text(
              'Successful',
              style: TextStyle(
                  color: isTextWhite == true ? AppColor.whiteColor : null),
            ),
          )
        ],
      ),
    );
  }
}
