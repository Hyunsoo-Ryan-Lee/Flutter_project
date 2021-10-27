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
        title: Text(
          '성별 선택',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/icons/men.png'),
                )),
            SizedBox(
              height: size.height * 0.1,
            ),
            InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new BMIwomen(txt: widget.txt),
                  );
                  Navigator.of(context).pushReplacement(route);
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => BMIwomen()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/icons/women.png'),
                )),
          ],
        ),
      ),
    );
  }
}
