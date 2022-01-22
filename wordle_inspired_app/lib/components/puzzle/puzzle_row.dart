import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/puzzle/puzzle_piece.dart';

class PuzzleRow extends StatefulWidget {
  PuzzleRow({
    Key? key,
    required this.height,
    required this.items,
  }) : super(key: key);

  double height;
  int items;
  @override
  _PuzzleRowState createState() => _PuzzleRowState();
}

class _PuzzleRowState extends State<PuzzleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < widget.items; i++)
          PuzzlePiece(
            height: widget.height,
            width: widget.items == 5
                ? MediaQuery.of(context).size.width * 0.16
                : MediaQuery.of(context).size.width * 0.14, // todo
          ),
      ],
    );
  }
}
