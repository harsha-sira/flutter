import 'package:flutter/material.dart';

class CustomisedButton extends StatelessWidget {
  const CustomisedButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        // padding: const EdgeInsets.all(4),
        backgroundColor: backgroundColor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        primary: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      onPressed: press,
      child: Text(text),
    );
  }
}
