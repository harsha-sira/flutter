import 'package:flutter/material.dart';
import 'body.dart';
import 'components/common_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithMenuIcon(),
      body: const Body(),
    );
  }
}
