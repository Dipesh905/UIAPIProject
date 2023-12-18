import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  /// initializing [key],[onPressed],[buttonTitle],[padding]
  const ButtonWidget({
    required this.onPressed,
    required this.buttonTitle,
    super.key,
    this.padding,
  });

  /// method that handles onPressed functionality
  final void Function()? onPressed;

  /// Title of Button
  final String buttonTitle;

  /// padding provided for title text
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        child: Padding(
          padding: padding == null ? const EdgeInsets.all(16) : padding!,
          child: Text(buttonTitle),
        ),
      );
}
