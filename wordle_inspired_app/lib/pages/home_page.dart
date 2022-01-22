import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/components/app_bar_custom_icon.dart';
import 'package:wordle_inspired_app/components/keyboard/keyboard.dart';
import 'package:wordle_inspired_app/components/main_body.dart';
import 'package:wordle_inspired_app/components/puzzle/puzzle_layout.dart';
import 'package:wordle_inspired_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          toolbarHeight: size.height * 0.06,
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
              Icons.help_outline,
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
          bottom: const TabBar(
            indicatorColor: Colors.black54,
            indicatorWeight: 4,
            tabs: [
              Tab(
                child: Text(
                  "5 Letters",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "6 Letterss",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainBody(rows: 6, items: 5),
            MainBody(rows: 7, items: 6),
          ],
        ),
      ),
    );
  }
}
