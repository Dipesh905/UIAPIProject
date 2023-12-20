import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/data/deposit_data.dart';
import 'package:uiapiapp/view/widgets/custom_listtile_widget.dart';

class DepositsListTileSection extends StatelessWidget {
  const DepositsListTileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Text(
              'February 02, 2002',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: deposits.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomListTile(
                bankImage: deposits[index].bankImage,
                bankName: deposits[index].bankName,
                amount: deposits[index].amount,
                successColor: deposits[index].depositSuccessColor,
                listTileCardColor: index == 0 ? Colors.black : null,
                isTextWhite: index == 0 ? true : false,
              );
            },
          ),
        ],
      ),
    );
  }
}
