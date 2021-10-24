import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class myDiet extends StatefulWidget {
  final List data;
  const myDiet({Key mykey, this.data}) : super(key: mykey);

  @override
  State<myDiet> createState() => _myDietState();
}

class _myDietState extends State<myDiet> {
  TextEditingController _datePeriod = TextEditingController();
  String address = 'http://8bef-121-128-108-65.ngrok.io/repository/dietselect';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Diet ',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  SelectDate(context);
                },
                child: Text('조회')),
            _dietTable()
          ],
        ),
      ),
    );
  }

  List date = [];
  List meal = [];
  List fname = [];
  List cal = [];
  List carboh = [];
  List protein = [];
  List fat = [];
  int period = 0;
  sendFoodData() async {
    print('음식데이터 전송 시작');
    http.Response response = await http.post(
      Uri.parse(address),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uuid': 'good@gmail.com', 'period': period}),
    );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      date = resJson['diet_datetime'];
      meal = resJson['meal'];
      fname = resJson['fname'];
      cal = resJson['cal'];
      carboh = resJson['carboh'];
      protein = resJson['protein'];
      fat = resJson['fat'];
      // print(date);
      // print(meal);
      // print(fname);
      // print(cal);
      // print(carboh);
      // print(protein);
      // print(fat);
    }
    setState(() {});
  }

  Widget _dataList() {
    return ListView(
        padding: const EdgeInsets.all(8),
        children: [for (int i = 0; i < date.length; i++) Text(date[i])]);
  }

  Widget _dietTable() {
    return Table(border: TableBorder.all(color: Colors.black), columnWidths: {
      0: FixedColumnWidth(80.0),
      1: FixedColumnWidth(36.0),
      2: FixedColumnWidth(50.0),
      3: FixedColumnWidth(36.0),
      4: FixedColumnWidth(36.0),
      5: FixedColumnWidth(36.0),
      6: FixedColumnWidth(36.0)
    }, children: [
      TableRow(children: [
        Text('날짜'),
        Text('시간'),
        Text('음식명'),
        Text('칼로리'),
        Text('탄수화물'),
        Text('단백질'),
        Text('지방'),
      ]),
      for (int i = 0; i < date.length; i++)
        TableRow(children: [
          Text(date[i]),
          Text(meal[i]),
          Text(fname[i]),
          Text(cal[i].toString()),
          Text(carboh[i].toString()),
          Text(protein[i].toString()),
          Text(fat[i].toString()),
        ])
    ]);
  }

  Future<void> SelectDate(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('식단 보기'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text('하루'),
                    onTap: () {
                      period = 1;
                      sendFoodData();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {
                      period = 3;
                      sendFoodData();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {
                      period = 7;
                      sendFoodData();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {
                      period = 15;
                      sendFoodData();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {
                      period = 30;
                      sendFoodData();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('기타'),
                    onTap: () {
                      Navigator.of(context).pop();
                      OtherDate(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> OtherDate(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '조회할 일 수',
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: TextField(
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('조회'))
                ],
              ),
            ),
          );
        });
  }
}
