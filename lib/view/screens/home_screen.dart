import 'package:flutter/material.dart';
import 'package:uiapiapp/view/screens/api_screens.dart';
import 'package:uiapiapp/view/screens/new_api_screen.dart';
import 'package:uiapiapp/view/screens/ui_screen.dart';
import 'package:uiapiapp/view/widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UIScreen()));
                  },
                  buttonTitle: 'UI'),
            ),
            ButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewApiScreen()));
                },
                buttonTitle: 'API')
          ],
        ),
      ),
    );
  }
}
