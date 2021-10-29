import 'dart:convert';
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Food/Table/TrainListview.dart';
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
  String check;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                InkWell(
                    onTap: () {
                      check = 'food';
                      SelectDate(context);
                    },
                    child: ClipRect(
                      child: Container(
                          height: 120,
                          child: Image.asset('assets/icons/food.png')),
                    )),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('음식 정보'),
                ))
              ],
            ),
            Stack(
              children: [
                InkWell(
                    onTap: () {
                      check = 'train';
                      SelectDate(context);
                    },
                    child: ClipRect(
                      child: Container(
                          height: 120,
                          child: Image.asset('assets/icons/train.png')),
                    )),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('운동 정보'),
                ))
              ],
            ),
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
    }
    setState(() {});
  }

  List count;
  List tname;
  sendTrainData() async {
    var queryParams = {'uuid': uuid, 'period': period};
    final uri = Uri.http(address, '/repository/train', queryParams);
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final response = await http.get(uri, headers: headers);
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(resJson);
      date = resJson['train_date'];
      tname = resJson['eid'];
      count = resJson['count'];
    }
    setState(() {});
  }

  // _navigatetotable() async {
  //   await Future.delayed(Duration(milliseconds: 2000), () {});
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => DietTable(
  //               data: [date, meal, fname, cal, carboh, protein, fat])));
  // }

  _NavigateDietList() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DietListview(
                data: [date, meal, fname, cal, carboh, protein, fat, period])));
  }

  _NavigateTrainList() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TrainListview(data: [date, tname, count, period])));
  }

  Future<void> SelectDate(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('기간 조회'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text('하루'),
                    onTap: () {
                      period = '1';
                      GetUserId();
                      if (check == 'food') {
                        sendFoodData();
                        Navigator.of(context).pop();
                        _NavigateDietList();
                      } else {
                        sendTrainData();
                        Navigator.of(context).pop();
                        _NavigateTrainList();
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {
                      period = '3';
                      GetUserId();
                      if (check == 'food') {
                        sendFoodData();
                        Navigator.of(context).pop();
                        _NavigateDietList();
                      } else {
                        sendTrainData();
                        Navigator.of(context).pop();
                        _NavigateTrainList();
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {
                      period = '7';
                      GetUserId();
                      if (check == 'food') {
                        sendFoodData();
                        Navigator.of(context).pop();
                        _NavigateDietList();
                      } else {
                        sendTrainData();
                        Navigator.of(context).pop();
                        _NavigateTrainList();
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {
                      period = '15';
                      GetUserId();
                      if (check == 'food') {
                        sendFoodData();
                        Navigator.of(context).pop();
                        _NavigateDietList();
                      } else {
                        sendTrainData();
                        Navigator.of(context).pop();
                        _NavigateTrainList();
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {
                      period = '30';
                      GetUserId();
                      if (check == 'food') {
                        sendFoodData();
                        Navigator.of(context).pop();
                        _NavigateDietList();
                      } else {
                        sendTrainData();
                        Navigator.of(context).pop();
                        _NavigateTrainList();
                      }
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
                          if (check == 'food') {
                            sendFoodData();
                            Navigator.of(context).pop();
                            _NavigateDietList();
                          } else {
                            sendTrainData();
                            Navigator.of(context).pop();
                          }
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
