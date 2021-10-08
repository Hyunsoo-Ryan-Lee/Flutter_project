import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  @override
  _listviewState createState() => _listviewState();
}

class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Listview Example"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: Icon(Icons.battery_full),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading: Icon(Icons.anchor),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Alarm"),
                subtitle: Text("This is the time."),
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Ballot"),
                subtitle: Text("Cast your vote."),
                leading: Icon(Icons.ballot),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: Icon(Icons.battery_full),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading: Icon(Icons.anchor),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Alarm"),
                subtitle: Text("This is the time."),
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Ballot"),
                subtitle: Text("Cast your vote."),
                leading: Icon(Icons.ballot),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: Icon(Icons.battery_full),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading: Icon(Icons.anchor),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Alarm"),
                subtitle: Text("This is the time."),
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Ballot"),
                subtitle: Text("Cast your vote."),
                leading: Icon(Icons.ballot),
                trailing: Icon(Icons.star))
          ],
        ));
  }
}
