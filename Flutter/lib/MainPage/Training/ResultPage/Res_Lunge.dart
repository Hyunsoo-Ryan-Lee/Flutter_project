import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_auth/main.dart';

class ResultLunge extends StatefulWidget {
  String fitname;
  int count;
  ResultLunge({this.fitname, this.count});

  @override
  _ResultLungeState createState() => _ResultLungeState();
}

class _ResultLungeState extends State<ResultLunge> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scaffold(
            body: CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: size.height * 0.12,
            ),
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/gif/congrat.gif'))),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('${widget.fitname} ${widget.count}회 수행을 완료하셨습니다!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            OutlinedButton(
                onPressed: () {
                  sendTrainInfo();
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 1500),
                    content: const Text("운동 정보 저장이 완료되었습니다."),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save Training Data',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(200, 20),
                  primary: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                )),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Don't Save",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(200, 20),
                  primary: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                )),
          ]),
        ),
      ),
    ])));
  }

  Future<http.Response> sendTrainInfo() {
    return http.post(
      Uri.parse('http://' + address + '/repository/train'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uuid': uuid,
        'eid': 'E3',
        'count': widget.count,
      }),
    );
  }
}
