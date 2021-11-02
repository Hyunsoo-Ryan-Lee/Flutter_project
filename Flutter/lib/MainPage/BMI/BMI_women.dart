import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Bottom_navbar.dart';
import 'package:flutter_auth/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BMIwomen extends StatefulWidget {
  var txt;
  BMIwomen({Key mykey, this.txt}) : super(key: mykey);
  @override
  _BMIwomenState createState() => _BMIwomenState();
}

class _BMIwomenState extends State<BMIwomen> {
  final formKey = GlobalKey<FormState>();
  double activation = 0;
  int currentindex = 0;
  String result = '';
  double height = 0;
  double weight = 0;
  int age = 0;
  final _valuelist = [
    '주로 좌식 생활',
    '주 1~3일 운동',
    '주 3~5일 운동',
    '거의 매일 운동',
    '매일 강도높게 운동'
  ];
  String dropdownValue = '주로 좌식 생활';
  String holder = '';
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question(2/2)',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.teal[200],
        centerTitle: true,
      ),
      body: Form(
        key: this.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    '나이를 입력하세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: _agecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '나이를 입력해주세요';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '신장을 입력하세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'cm',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: _heightcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '신장을 입력해주세요';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '체중을 입력하세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'kg',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: _weightcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '체중을 입력해주세요';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '활동 정도를 선택하세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Center(
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        getDropDownItem();
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: _valuelist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      elevation: 4,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Center(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size(300, 50),
                            primary: Colors.black,
                            backgroundColor: Colors.black12),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              age = int.parse(_agecontroller.value.text);
                              height =
                                  double.parse(_heightcontroller.value.text);
                              weight =
                                  double.parse(_weightcontroller.value.text);
                            });
                            calculateBmi(age, height, weight);

                            sendWomenInfo([
                              _agecontroller.value.text,
                              _heightcontroller.value.text,
                              _weightcontroller.value.text,
                              dropdownValue
                            ]);
                            final snackBar = SnackBar(
                              content: const Text("회원가입이 완료되었습니다."),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigator()));
                          }
                        },
                        child: Text(
                          '회원가입 완료하기!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> sendWomenInfo(List title) {
    return http.post(
      Uri.parse('http://' + address + '/member/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uuid': widget.txt[0],
        'upw': widget.txt[1],
        'usex': 'F',
        'uage': title[0],
        'uheight': title[1],
        'uweight': title[2],
        'uact': title[3],
        'urdc': result
      }),
    );
  }

  void calculateBmi(int age, double height, double weight) {
    if (dropdownValue == '주로 좌식 생활') {
      activation = 1.2;
    } else if (dropdownValue == '주 1~3일 운동') {
      activation = 1.3;
    } else if (dropdownValue == '주 3~5일 운동') {
      activation = 1.5;
    } else if (dropdownValue == '거의 매일 운동') {
      activation = 1.7;
    } else {
      activation = 1.9;
    }
    double finalresult =
        (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)) * activation;
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void change(int index) {
    setState(() {
      currentindex = index;
    });
  }

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }
}
