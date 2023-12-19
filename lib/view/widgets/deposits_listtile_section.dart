import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/data/deposit_data.dart';
import 'package:uiapiapp/view/widgets/custom_listtile_widget.dart';

class DepositsListTileSection extends StatelessWidget {
  const DepositsListTileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: deposits.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomListTile(
          bankName: deposits[index].bankName,
          amount: deposits[index].amount,
          successColor: deposits[index].depositSuccessColor,
          listTileCardColor: index == 0 ? Colors.black : null,
          isTextWhite: index == 0 ? true : false,
        );
      },
    );
  }
}
