import 'package:flutter/material.dart';

class SingleKey extends StatefulWidget {
  SingleKey({
    Key? key,
    required this.kcolor,
    required this.textColor,
    required this.letter,
    required this.function,
    required this.width,
  }) : super(key: key);

  Color kcolor;
  Color textColor;
  String letter;
  VoidCallback function;
  double width;

  @override
  _SingleKeyState createState() => _SingleKeyState();
}

class _SingleKeyState extends State<SingleKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      width: widget.width,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextButton(
        onPressed: widget.function,
        child: Text(
          widget.letter,
          style:
              TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
