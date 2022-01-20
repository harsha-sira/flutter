import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    Key? key,
    required this.icon,
    required this.function,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: kIdleColor,
      iconSize: 30,
      onPressed: function,
    );
  }
}
