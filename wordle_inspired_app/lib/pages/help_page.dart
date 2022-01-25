import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/puzzle/puzzle_piece.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "How to Play".toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.grey,
            onPressed: () {},
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Flexible(
              child: Row(
                children: const [
                  Text("Guess the ",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Text(
                    "WORDLE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    " within given tries",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Flexible(
                  child: Text(
                      "Each guess must be a valid 5 or 6 letter word. Hit the enter button to submit.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Flexible(
                  child: Text(
                      "After each guess, the color of the tiles will change to show how close your guess was to the word.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Flexible(
                  child: Text("Examples",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Flexible(
              child: Row(
                children: const [
                  Text(
                    "The letter ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "W",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " is in the word and in thencorrect spot.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Flexible(
              child: Row(
                children: const [
                  Text(
                    "The letter ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "I",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " is in the word but in the wrong spot.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: PuzzlePiece(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Text(
                  "The letter ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "U",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " is not in the word in any spot.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Flexible(
                  child: Text("A new WORDLE will be available each day!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
