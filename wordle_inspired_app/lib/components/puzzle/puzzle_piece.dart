import 'package:flutter/material.dart';

class PuzzlePiece extends StatefulWidget {
  PuzzlePiece({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  double height;
  double width;
  @override
  _PuzzlePieceState createState() => _PuzzlePieceState();
}

class _PuzzlePieceState extends State<PuzzlePiece> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Color(0xFF38b000),
        // border: Border.all(
        //   color: Colors.black38,
        //   width: 1,
        //   style: BorderStyle.solid,
        // ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "D",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
