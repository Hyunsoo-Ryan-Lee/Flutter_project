import 'package:flutter/material.dart';

class row extends StatefulWidget {
  @override
  _rowState createState() => _rowState();
}

class _rowState extends State<row> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Row Example"),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "React.js",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "Flutter",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "MySQL",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            )
          ]),
    );
  }
}
