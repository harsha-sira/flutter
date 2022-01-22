import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/keyboard/keyboard.dart';
import 'package:wordle_inspired_app/components/puzzle/puzzle_layout.dart';

class MainBody extends StatelessWidget {
  MainBody({
    Key? key,
    required this.rows,
    required this.items,
  }) : super(key: key);

  int rows;
  int items;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
            // width: size.width,
            // height: size.height * 0.55,
            // child: Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: size.width * 0.06,
            //     vertical: size.width * 0.12,
            //   ),
            //   child: Puzzle(
            //     rows: rows,
            //     items: items,
            //   ),
            // ),
            ),
        Container(
          width: size.width,
          height: size.height * 0.28,
          padding: EdgeInsets.only(bottom: 30),
          child: Keyboard(),
        ),
      ],
    );
  }
}
