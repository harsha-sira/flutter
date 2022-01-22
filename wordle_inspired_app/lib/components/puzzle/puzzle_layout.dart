import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/puzzle/puzzle_row.dart';

class Puzzle extends StatefulWidget {
  Puzzle({
    Key? key,
    required this.rows,
    required this.items,
  }) : super(key: key);

  int rows;
  int items;

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < widget.rows; i++)
          PuzzleRow(
            height: widget.rows == 6
                ? MediaQuery.of(context).size.height * 0.075
                : MediaQuery.of(context).size.height * 0.065,
            items: widget.items,
          )
      ],
    );
  }
}
