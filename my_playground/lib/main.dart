import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Playground',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Playground'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return Container(
              child: Card(
                color: Colors.yellow,
                elevation: 5,
                child: Center(
                  child: Text('ITEM $index'),
                ),
                margin: EdgeInsets.all(20),
              ),
            );
          }),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
