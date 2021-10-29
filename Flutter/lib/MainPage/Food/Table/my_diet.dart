import 'dart:convert';
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Food/Table/dietListview.dart';
import 'package:flutter_auth/MainPage/Food/Table/dietTable.dart';
import 'package:flutter_auth/main.dart';
import 'package:http/http.dart' as http;

class myDiet extends StatefulWidget {
  final List data;
  const myDiet({Key mykey, this.data}) : super(key: mykey);

  @override
  State<myDiet> createState() => _myDietState();
}

class _myDietState extends State<myDiet> {
  TextEditingController _datePeriod = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                child: Text('날짜별 식단 조회',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                    )))
          ],
        ),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String uuid = '';
  void GetUserId() {
    final User user = auth.currentUser;
    uuid = user.email;
  }

  List date = [];
  List meal = [];
  List fname = [];
  List cal = [];
  List carboh = [];
  List protein = [];
  List fat = [];
  String period = '';
  sendFoodData() async {
    var queryParams = {'uuid': uuid, 'period': period};
    final uri = Uri.http(address, '/repository/diet', queryParams);
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final response = await http.get(uri, headers: headers);
    // http.Response response = await http.post(
    //   Uri.parse(address),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode({'uuid': 'good@gmail.com', 'period': period}),
    // );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      date = resJson['diet_datetime'];
      meal = resJson['meal'];
      fname = resJson['fname'];
      cal = resJson['cal'];
      carboh = resJson['carboh'];
      protein = resJson['protein'];
      fat = resJson['fat'];
      print(date);
      // print(meal);
      // print(fname);
      // print(cal);
      // print(carboh);
      // print(protein);
      // print(fat);
    }
    setState(() {});
  }

  Widget _dietTable() {
    return Table(border: TableBorder.all(color: Colors.black), columnWidths: {
      0: FixedColumnWidth(70.0),
      1: FixedColumnWidth(36.0),
      2: FixedColumnWidth(70.0),
      3: FixedColumnWidth(40.0),
      4: FixedColumnWidth(60.0),
      5: FixedColumnWidth(40.0),
      6: FixedColumnWidth(40.0)
    }, children: [
      TableRow(children: [
        Text(
          '날짜',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '시간',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '음식명',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '칼로리',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '탄수화물',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '단백질',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '지방',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
      for (int i = 0; i < date.length; i++)
        TableRow(children: [
          Text(
            date[i],
            textAlign: TextAlign.center,
          ),
          Text(
            meal[i],
            textAlign: TextAlign.center,
          ),
          Text(
            fname[i],
            textAlign: TextAlign.center,
          ),
          Text(
            cal[i].toString(),
            textAlign: TextAlign.center,
          ),
          Text(
            carboh[i].toString(),
            textAlign: TextAlign.center,
          ),
          Text(
            protein[i].toString(),
            textAlign: TextAlign.center,
          ),
          Text(
            fat[i].toString(),
            textAlign: TextAlign.center,
          ),
        ])
    ]);
  }

  _navigatetotable() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DietTable(
                data: [date, meal, fname, cal, carboh, protein, fat])));
  }

  _navigatetolist() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DietListview(
                data: [date, meal, fname, cal, carboh, protein, fat, period])));
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
                      period = '1';
                      GetUserId();
                      sendFoodData();
                      Navigator.of(context).pop();
                      _navigatetolist();

                      // Navigator.of(context).pop();
                      // var routeChart = MaterialPageRoute(
                      //     builder: (BuildContext context) => DietTable(data: [
                      //           date,
                      //           meal,
                      //           fname,
                      //           cal,
                      //           carboh,
                      //           protein,
                      //           fat
                      //         ]));
                      // Navigator.of(context).pushReplacement(routeChart);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {
                      period = '3';
                      GetUserId();
                      sendFoodData();
                      Navigator.of(context).pop();
                      _navigatetolist();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {
                      period = '7';
                      GetUserId();
                      sendFoodData();
                      Navigator.of(context).pop();
                      _navigatetolist();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {
                      period = '15';
                      GetUserId();
                      sendFoodData();
                      Navigator.of(context).pop();
                      _navigatetolist();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {
                      period = '30';
                      GetUserId();
                      sendFoodData();
                      Navigator.of(context).pop();
                      _navigatetolist();
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
                    child: Form(
                      key: _formkey,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _datePeriod,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '일 수를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          period = _datePeriod.text;
                          GetUserId();
                          sendFoodData();
                          Navigator.of(context).pop();
                          _datePeriod.clear();
                          print(period);
                          _navigatetolist();
                        }
                      },
                      child: Text('조회'))
                ],
              ),
            ),
          );
        });
  }
}
