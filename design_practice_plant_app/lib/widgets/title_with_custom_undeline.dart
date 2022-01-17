import 'package:flutter/material.dart';

import '../constants.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding / 4),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: kPrimaryColor.withOpacity(0.2),
                  height: 7,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
