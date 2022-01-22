import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/Key.dart';

class KeyBoardRowMiddle extends StatelessWidget {
  const KeyBoardRowMiddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          Container(),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "W",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: 35,
            function: () {
              print("Key");
            },
          ),
        ],
      ),
    );
  }
}
