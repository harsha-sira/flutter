import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/Key.dart';
import 'package:wordle_inspired_app/components/keyboard_row.dart';
import 'package:wordle_inspired_app/components/keyboard_row_middle.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          KeyBoardRow(),
          KeyBoardRowMiddle(),
          Expanded(
            child: Row(
              children: [
                SingleKey(
                  kcolor: Colors.red,
                  textColor: Colors.black,
                  letter: "W",
                  width: 35,
                  function: () {
                    print("Key");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
