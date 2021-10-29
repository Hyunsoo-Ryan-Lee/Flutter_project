import 'package:flutter/material.dart';

class ResultJumpSquat extends StatefulWidget {
  String fitname;
  int count;
  ResultJumpSquat({this.fitname, this.count});

  @override
  _ResultJumpSquatState createState() => _ResultJumpSquatState();
}

class _ResultJumpSquatState extends State<ResultJumpSquat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('운동 끝!'))
            ],
          ),
        ),
      ),
    );
  }
}
