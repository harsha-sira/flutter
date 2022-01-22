import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/keyboard/Key.dart';

class KeyBoardRowMiddle extends StatelessWidget {
  const KeyBoardRowMiddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.03,
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
          SizedBox(
            width: size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
