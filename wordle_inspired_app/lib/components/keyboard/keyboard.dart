import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/keyboard/Key.dart';
import 'package:wordle_inspired_app/components/keyboard/keyboard_row.dart';
import 'package:wordle_inspired_app/components/keyboard/keyboard_row_last.dart';
import 'package:wordle_inspired_app/components/keyboard/keyboard_row_middle.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        KeyBoardRow(),
        KeyBoardRowMiddle(),
        KeyBoardRowLast(),
      ],
    );
  }
}
