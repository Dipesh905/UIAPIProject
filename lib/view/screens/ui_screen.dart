import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/view/widgets/activities_and_transaction_section.dart';
import 'package:uiapiapp/view/widgets/transaction_card_section.dart';

class UIScreen extends StatelessWidget {
  const UIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: AppColor.lightGreyColor,
                child: const Center(child: Icon(Icons.arrow_back_ios)),
              ),
            )),
        // automaticallyImplyLeading: false,
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ActivitiesAndTransactionSection(),
              TransactionCardSection()
            ],
          ),
        ),
      ),
    );
  }
}
