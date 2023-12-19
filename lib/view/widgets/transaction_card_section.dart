import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/data/transactions_data.dart';
import 'package:uiapiapp/view/widgets/common_card_widget.dart';

class TransactionCardSection extends StatelessWidget {
  const TransactionCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return CommonCardWidget(
              title: transactions[index].title,
              amount: transactions[index].amount,
              cardColor: transactions[index].color,
              iconData: transactions[index].icon);
        },
      ),
    );
  }
}
