import 'package:flutter/material.dart';

class ButtonName extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonName({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
