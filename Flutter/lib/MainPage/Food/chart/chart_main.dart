import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Food/chart/visual.dart';
import 'package:flutter_auth/main.dart';
import 'package:http/http.dart' as http;

class VisualData extends StatefulWidget {
  final List data;
  const VisualData({Key mykey, this.data}) : super(key: mykey);

  @override
  State<VisualData> createState() => _VisualDataState();
}

class _VisualDataState extends State<VisualData> {
  TextEditingController _datePeriod = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal[200],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  SelectDate(context);
                },
                child: ClipRect(
                  child: Container(
                      height: 150,
                      child: Image.asset('assets/icons/chart.png')),
                )),
          ],
        ),
      ),
    );
  }

  List date = [];
  List cal = [];
  List carboh = [];
  List protein = [];
  List fat = [];
  int period = 0;
  sendFoodData() async {
    print('데이터 전송 시작');
    http.Response response = await http.post(
      Uri.parse('http://' + address + '/repository/dietvis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uuid': uuid, 'period': period}),
    );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      date = resJson['diet_datetime'];
      cal = resJson['cal'];
      carboh = resJson['carboh'];
      protein = resJson['protein'];
      fat = resJson['fat'];
      // calsum = cal.reduce((value, element) => value + element);
      print(resJson);
    }
    setState(() {});
  }

  _navigatetograph() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ReportChart(data: [date, cal, carboh, protein, fat])));
  }

  Future<void> SelectDate(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('영양소 비율 보기'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text('하루'),
                    onTap: () {
                      period = 1;
                      sendFoodData();
                      GetUserId();
                      Navigator.of(context).pop();
                      _navigatetograph();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {
                      period = 3;
                      sendFoodData();
                      GetUserId();
                      Navigator.of(context).pop();
                      _navigatetograph();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {
                      period = 7;
                      sendFoodData();
                      GetUserId();
                      Navigator.of(context).pop();
                      _navigatetograph();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {
                      period = 15;
                      sendFoodData();
                      GetUserId();
                      Navigator.of(context).pop();
                      _navigatetograph();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {
                      period = 30;
                      sendFoodData();
                      GetUserId();
                      Navigator.of(context).pop();
                      _navigatetograph();
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
                          period = int.parse(_datePeriod.text);
                          sendFoodData();
                          Navigator.of(context).pop();
                          _datePeriod.clear();
                          print(period);
                          _navigatetograph();
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
