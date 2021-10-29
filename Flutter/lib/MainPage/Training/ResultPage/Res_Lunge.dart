import 'package:flutter/material.dart';

class ResultLunge extends StatefulWidget {
  // const ResultLunge({ Key? key }) : super(key: key);

  @override
  _ResultLungeState createState() => _ResultLungeState();
}

class _ResultLungeState extends State<ResultLunge> {
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
