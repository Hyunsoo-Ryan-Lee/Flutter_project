import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/BMI/BMI_men.dart';
import 'package:flutter_auth/MainPage/BMI/BMI_women.dart';

class selectSex extends StatefulWidget {
  var txt;
  selectSex({Key mykey, this.txt}) : super(key: mykey);

  @override
  State<selectSex> createState() => _selectSexState();
}

class _selectSexState extends State<selectSex> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Question(1/2)',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.teal[200],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                '성별을 선택해주세요',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: size.height * 0.04),
              Column(
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new BMImen(txt: widget.txt),
                            );
                            Navigator.of(context).push(route);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/icons/men.png',
                                width: 200, height: 200, fit: BoxFit.fill),
                          )),
                      Text('Male')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new BMIwomen(txt: widget.txt),
                            );
                            Navigator.of(context).push(route);
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => BMIwomen()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/icons/women.png',
                                width: 200, height: 200, fit: BoxFit.fill),
                          )),
                      Text('Female')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
