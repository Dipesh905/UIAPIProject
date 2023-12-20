import 'package:flutter/material.dart';
import 'package:uiapiapp/controller/resources/colors.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: AppColor.lightGreyColor,
                child: const Center(child: Icon(Icons.arrow_back_ios)),
              ),
            ),
          ),
          const Text(
            'History',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
