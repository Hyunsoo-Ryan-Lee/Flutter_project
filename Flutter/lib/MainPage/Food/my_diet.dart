import 'package:flutter/material.dart';

class myDiet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Diet ',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
    );
  }
}
