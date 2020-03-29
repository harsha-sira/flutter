import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Network Calls'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Click to get data',
        child: const Icon(Icons.add_a_photo),
        onPressed: () {
          fetchData();
        },
      ),
      body: Center(child: Text('You have pressed the buttontimes.')),
    );
  }

  void fetchData() async {
    var result = await get('https://jsonplaceholder.typicode.com/photos');
    print(result.body);
  }
}
