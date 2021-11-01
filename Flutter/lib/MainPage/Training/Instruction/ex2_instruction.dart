import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/pose/Pose_JumpSquat.dart';
import 'package:flutter_auth/main.dart';

class Instruction_2 extends StatefulWidget {
  int count;
  Instruction_2({Key mykey, this.count}) : super(key: mykey);
  @override
  State<Instruction_2> createState() => _Instruction_2State();
}

class _Instruction_2State extends State<Instruction_2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Instruction',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '>> 전신이 보이도록 카메라를 위치시켜주세요 <<',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              child: Image.asset('assets/gif/jumpsquat.gif'),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Text('1. 어깨 넓이로 발을 벌리고 양 팔은 몸에 가볍게 붙인다.\n'),
                    Text(
                        '2. 밸런스를 취하며 숨도 들이쉬면서 그대로 무릎을 굽혀 허벅지와 바닥이 평행을 이룰 때까지 허리를 낮춘다.\n'),
                    Text('3. 평행 상태에서 1초 정도 머문 후 숨을 뱉으면서 힘껏 점프를 한다.\n'),
                    Text('4. 착지와 동시에 무릎을 굽혀 허벅지와 바닥이 평행을 이룰 때까지 허리를 낮춘다.'),
                  ]),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  onSelectJ(
                    context: context,
                    modelName: 'posenet',
                    count: widget.count,
                  );
                },
                child: Text(
                  'START   >',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(120, 15),
                  primary: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                )),
            SizedBox(
              height: size.height * 0.1,
            )
          ]),
        ),
      ),
    );
  }

  void onSelectJ({BuildContext context, String modelName, int count}) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PoseJumpSquat(
          cameras: cameras,
          title: modelName,
          count: count,
        ),
      ),
    );
  }
}
