import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/keyboard/Key.dart';

class KeyBoardRow extends StatelessWidget {
  const KeyBoardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var letters = [];
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
          SingleKey(
            kcolor: Colors.grey,
            textColor: Colors.black,
            letter: "Q",
            width: size.width * 0.08,
            function: () {
              print("Key");
            },
          ),
        ],
      ),
    );
  }
}
