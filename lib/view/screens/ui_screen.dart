import 'package:flutter/material.dart';
import 'package:uiapiapp/view/widgets/activities_and_transaction_section.dart';
import 'package:uiapiapp/view/widgets/app_bar_header_section.dart';
import 'package:uiapiapp/view/widgets/deposits_listtile_section.dart';
import 'package:uiapiapp/view/widgets/transaction_card_section.dart';

class UIScreen extends StatelessWidget {
  const UIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 100,
                //   width: 200,
                //   color: Colors.blue,
                //   child: Stack(
                //     children: [

                //       Positioned(
                //         top: -10,
                //         left: 0,
                //         // bottom: 100,
                //         child: Transform.rotate(
                //           angle: 45,
                //           child: Container(
                //             height: 20,
                //             width: 10,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         top: -10,
                //         right: -3,
                //         // bottom: 100,
                //         child: Transform.rotate(
                //           angle: 135 + 45 + 45 + 10,
                //           child: Container(
                //             height: 20,
                //             width: 10,
                //             color: Colors.white,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                AppBarSection(),
                Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 8),
                  child: ActivitiesAndTransactionSection(),
                ),
                TransactionCardSection(),
                DepositsListTileSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
