// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/app_bar_custom_icon.dart';
import 'package:wordle_inspired_app/components/row_with_toggle_button.dart';
import 'package:wordle_inspired_app/constants.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        toolbarHeight: size.height * 0.06,
        centerTitle: true,
        title: const Text(
          "SETTINGS",
          style: TextStyle(
            color: kBasicFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CustomAppBarIconButton(
            icon: Icon(Icons.close),
            function: () {
              print("Close clicked");
            },
          ),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            RowWithToogleButton(
              mainText: "Show Word Meaning",
              subText: "Show meaning of the word, once you resolve it",
              function: (value) {
                print("Clicked");
              },
            ),
            RowWithToogleButton(
              mainText: "Show Word History",
              subText: "Show previously resolved words and there meaning",
              function: (value) {
                print("Clicked");
              },
            ),
            RowWithToogleButton(
              mainText: "Dark Theme",
              function: (value) {
                print("Clicked");
              },
            ),
            RowWithToogleButton(
              mainText: "Color Blind Mode",
              subText: "High contrast Colors",
              function: (value) {
                print("Clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}
