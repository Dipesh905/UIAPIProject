import 'package:flutter/material.dart';

class UIScreen extends StatelessWidget {
  const UIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.arrow_back_ios),
              ),
            )),
        automaticallyImplyLeading: false,
        title: const Text('UI Screen'),
      ),
    );
  }
}
