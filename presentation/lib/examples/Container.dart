import 'package:flutter/material.dart';

class container extends StatefulWidget {
  @override
  _containerState createState() => _containerState();
}

class _containerState extends State<container> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Container Example"),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(35),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                new BoxShadow(
                  color: Colors.green,
                  offset: new Offset(6.0, 6.0),
                ),
              ],
            ),
            child: Text("Hello! I am in the container widget decoration box!!",
                style: TextStyle(fontSize: 30)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.green,
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(35),
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.1),
            child: Text("Hello! I am in the container widget!!",
                style: TextStyle(fontSize: 25)),
          ),
        ]));
  }
}
