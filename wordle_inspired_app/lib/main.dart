import 'package:flutter/material.dart';
import 'package:wordle_inspired_app/pages/help_page.dart';
import 'package:wordle_inspired_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: const HomeScreen(),
      home: const Help(),
    );
  }
}
