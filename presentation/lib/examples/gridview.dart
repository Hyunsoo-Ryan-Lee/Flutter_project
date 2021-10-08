import 'package:flutter/material.dart';

class gridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Center(
        child: Container(
          // height: 200,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: [
              Card(
                color: Colors.teal,
              ),
              Card(
                color: Colors.cyan,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.deepOrange,
              ),
              Card(
                color: Colors.red,
              ),
              Card(
                color: Colors.yellow,
              ),
              Card(
                color: Colors.purpleAccent,
              ),
              Card(
                color: Colors.indigo,
              ),
              Card(
                color: Colors.black,
              ),
              Card(
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
