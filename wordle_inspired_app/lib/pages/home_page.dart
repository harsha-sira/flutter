import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/app_bar_custom_icon.dart';
import 'package:wordle_inspired_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "WORDLE",
          style: TextStyle(
              color: kBasicFontColor,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              letterSpacing: 6),
        ),
        leading: CustomAppBarIconButton(
          icon: const Icon(
            Icons.help_center_outlined,
          ),
          function: () {
            print("help clicked");
          },
        ),
        backgroundColor: kBackgroundColor,
        elevation: 1.0,
        actions: [
          CustomAppBarIconButton(
            icon: Icon(Icons.bar_chart_outlined),
            function: () {
              print("Stats clicked");
            },
          ),
          CustomAppBarIconButton(
            icon: Icon(Icons.settings),
            function: () {
              print("Settings clicked");
            },
          ),
        ],
      ),
    );
  }
}
