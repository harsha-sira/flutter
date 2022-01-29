import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWithToogleButton extends StatelessWidget {
  const RowWithToogleButton({
    Key? key,
  }) : super(key: key);

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
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Dark Theme",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "sub text",
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: false,
              onChanged: (value) {
                print(value);
              },
              activeColor: Colors.green,
              trackColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
