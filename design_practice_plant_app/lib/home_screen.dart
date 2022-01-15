import 'package:design_practice_plant_app/constants.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){log('clicked');},
        )
      )
    );
  }
}
