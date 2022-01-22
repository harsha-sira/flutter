import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/keyboard/Key.dart';
import 'package:wordle_inspired_app/components/keyboard/special_keys.dart';

class KeyBoardRowLast extends StatelessWidget {
  const KeyBoardRowLast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialKey(
            kcolor: Color(0xFFe5e5e5),
            textColor: Colors.black,
            letter: "ENTER",
            width: size.width * 0.13,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Color(0xFFe5e5e5),
            textColor: Colors.black,
            letter: "W",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Color(0xFFe5e5e5),
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
          SpecialKey(
            kcolor: Color(0xFFe5e5e5),
            textColor: Colors.black,
            letter: "",
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.black,
            ),
            width: size.width * 0.13,
            function: () {
              print("Key");
            },
          ),
        ],
      ),
    );
  }
}
