import 'package:flutter/material.dart';

class card extends StatefulWidget {
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Card Example"),
      ),
      body: Container(
        width: 250,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.brown,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title:
                      Text('Desperado', style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('EAGLES', style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
