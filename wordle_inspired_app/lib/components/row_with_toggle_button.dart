import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWithToogleButton extends StatelessWidget {
  const RowWithToogleButton(
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
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: false,
              onChanged: function(false),
              activeColor: Colors.green,
              trackColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
