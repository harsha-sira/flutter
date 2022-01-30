import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWithLinks extends StatelessWidget {
  const RowWithLinks(
      {Key? key, required this.mainText, required this.function, this.subText})
      : super(key: key);

  final String mainText;
  final String? subText;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              if (subText != null) ...[
                Text(
                  subText ?? "",
                  style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              ]
            ],
          ),
          const Spacer(),
          InkWell(
            child: const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              print("tap");
            },
          ),
          const Text(
            " | ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          InkWell(
            child: const Text(
              "Twitter",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              print("tap");
            },
          ),
        ],
      ),
    );
  }
}
