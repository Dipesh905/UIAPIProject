import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/provider/activity_transaction_provider.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/view/widgets/common_card_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColor.lightGreyColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer(
                  builder: (context, ref, child) {
                    final ActivityTransactionStatus activityTransactionStatus =
                        ref.watch(activityTransactionStatusProvider);

                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(
                                    activityTransactionStatusProvider.notifier,
                                  )
                                  .update(
                                    (ActivityTransactionStatus state) =>
                                        ActivityTransactionStatus.activity,
                                  );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                gradient: activityTransactionStatus ==
                                        ActivityTransactionStatus.activity
                                    ? LinearGradient(
                                        colors: AppColor.bluePinkGradient)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  'Activities',
                                  style: TextStyle(
                                      fontWeight: activityTransactionStatus ==
                                              ActivityTransactionStatus.activity
                                          ? FontWeight.bold
                                          : null,
                                      color: activityTransactionStatus ==
                                              ActivityTransactionStatus.activity
                                          ? AppColor.blackColor
                                          : AppColor.greyColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(
                                    activityTransactionStatusProvider.notifier,
                                  )
                                  .update(
                                    (ActivityTransactionStatus state) =>
                                        ActivityTransactionStatus.transaction,
                                  );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                gradient: activityTransactionStatus ==
                                        ActivityTransactionStatus.transaction
                                    ? LinearGradient(
                                        colors: AppColor.bluePinkGradient)
                                    : null,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Text(
                                  'Transaction',
                                  style: TextStyle(
                                    fontWeight: activityTransactionStatus ==
                                            ActivityTransactionStatus
                                                .transaction
                                        ? FontWeight.bold
                                        : null,
                                    color: activityTransactionStatus ==
                                            ActivityTransactionStatus
                                                .transaction
                                        ? AppColor.blackColor
                                        : AppColor.greyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CommonCardWidget(
                        title: 'Total Deposit',
                        amount: 22534.05,
                        cardColor: AppColor.lightPinkColor,
                        iconData: Icons.add),
                    CommonCardWidget(
                        title: 'Total Withdrawal',
                        amount: 22534.05,
                        cardColor: AppColor.lightBlueColor,
                        iconData: Icons.remove),
                    CommonCardWidget(
                        title: 'title',
                        amount: 28723.32,
                        cardColor: AppColor.lightPurpleColor,
                        iconData: Icons.phone)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
