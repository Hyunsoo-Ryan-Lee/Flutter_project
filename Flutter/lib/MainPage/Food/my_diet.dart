import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class myDiet extends StatefulWidget {
//   var data;
//   myDiet({Key mykey, this.data}) : super(key: mykey);

//   @override
//   _myDietState createState() => _myDietState();
// }

// class _myDietState extends State<myDiet> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My Diet ',
//           style: TextStyle(color: Colors.black),
//         ),
//         elevation: 0.0,
//         backgroundColor: Colors.blueAccent[100],
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Text('${widget.data}'),
//         ],
//       ),
//     );
//   }
// }

class myDiet extends StatefulWidget {
  final List data;
  const myDiet({Key mykey, this.data}) : super(key: mykey);

  @override
  State<myDiet> createState() => _myDietState();
}

class _myDietState extends State<myDiet> {
  TextEditingController _heightcontroller = TextEditingController();
  String address = '';
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
                child: Text('조회'))
          ],
        ),
      ),
    );
  }

  var rawstring = '';

  var cutstring = '';

  var array = '';

  var fname = '';

  int famount;

  double fcal;

  double fcarboh;

  double fprotein;

  double ffat;

  Future<http.Response> sendFoodData(List diet) {
    return http.post(
      Uri.parse(address),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uuid': diet[0],
        'meal': diet[1],
        'fname': diet[2],
        'famount': diet[3],
        'fcal': diet[4],
        'fcarboh': diet[5],
        'fprotein': diet[5],
        'ffat': diet[7]
      }),
    );
  }

  // uploadImage() async {
  //   final request = http.MultipartRequest('POST', Uri.parse(address));
  //   final headers = {'Content-Type': 'application/json; charset=UTF-8'};
  //   request.files.add(http.MultipartFile(
  //       'image', _image.readAsBytes().asStream(), _image.lengthSync(),
  //       filename: _image.path.split('/').last));
  //   request.headers.addAll(headers);
  //   final response = await request.send();
  //   http.Response res = await http.Response.fromStream(response);
  //   final resJson = jsonDecode(res.body);
  //   if (response.statusCode == 200) {
  //     fname = resJson['fname'];
  //     famount = resJson['famount'];
  //     fcal = resJson['fcal'];
  //     fcarboh = resJson['fcarboh'];
  //     fprotein = resJson['fprotein'];
  //     ffat = resJson['ffat'];
  //   }
  //   setState(() {});
  // }

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
                      print('하루');
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {
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
