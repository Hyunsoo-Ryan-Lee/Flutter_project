import 'package:flutter/material.dart';

class buttons extends StatefulWidget {
  @override
  _buttonsState createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Button Example"),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused)) return Colors.red;
                return null; // Defer to the widget's default.
              }),
            ),
            onPressed: () {},
            child: Text('TextButton'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            child: Text('ElevatedButton'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.grey),
            ),
            onPressed: () {},
            child: Text('OutlinedButton'),
          )
        ]),
      ),
    );
  }
}
