import 'package:flutter/material.dart';

class SpecialKey extends StatefulWidget {
  SpecialKey(
      {Key? key,
      required this.kcolor,
      required this.textColor,
      required this.letter,
      required this.function,
      required this.width,
      this.icon = const Icon(Icons.backspace)})
      : super(key: key);

  Color kcolor;
  Color textColor;
  String letter;
  VoidCallback function;
  double width;
  Icon icon;

  @override
  _SpecialKeyState createState() => _SpecialKeyState();
}

class _SpecialKeyState extends State<SpecialKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      width: widget.width,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: widget.kcolor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextButton(
        onPressed: widget.function,
        child: widget.letter.isEmpty
            ? widget.icon
            : Text(
                widget.letter,
                style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11),
              ),
      ),
    );
  }
}
