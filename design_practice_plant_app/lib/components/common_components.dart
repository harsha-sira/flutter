import 'dart:developer';

import 'package:design_practice_plant_app/constants.dart';
import 'package:flutter/material.dart';

// app bar with menu icon
AppBar appBarWithMenuIcon() {
  return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          log('clicked');
        },
      ));
}
