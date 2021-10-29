import 'package:flutter/material.dart';

class ResultArmPress extends StatefulWidget {
  // const ResultArmPress({ Key? key }) : super(key: key);

  @override
  _ResultArmPressState createState() => _ResultArmPressState();
}

class _ResultArmPressState extends State<ResultArmPress> {
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
