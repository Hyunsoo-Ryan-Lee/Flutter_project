import 'package:flutter/material.dart';

class ResultSquat extends StatefulWidget {
  // const ResultSquat({ Key? key }) : super(key: key);

  @override
  _ResultSquatState createState() => _ResultSquatState();
}

class _ResultSquatState extends State<ResultSquat> {
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
