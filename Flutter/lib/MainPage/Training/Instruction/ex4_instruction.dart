import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/pose/Pose_Squat.dart';
import 'package:flutter_auth/main.dart';

class Instruction_4 extends StatefulWidget {
  int count;
  Instruction_4({Key mykey, this.count}) : super(key: mykey);
  @override
  State<Instruction_4> createState() => _Instruction_4State();
}

class _Instruction_4State extends State<Instruction_4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'INSTRUCTION',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(children: <Widget>[
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/gif/squat.gif'))),
                )),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Text('1. 어깨 넓이로 발을 벌리고 양 팔은 몸에 가볍게 붙인다.\n'),
                        Text(
                            '2. 밸런스를 취하며 숨도 들이쉬면서 그대로 무릎을 굽혀 허리 위 상반신을 내린다.\n'),
                        Text(
                            '3. 등뼈가 아치형태를 유지하도록 하며 허벅지와 바닥이 평행을 이룰 때까지 허리를 낮춘다.\n'),
                        Text(
                            '4. 평행 상태에서 1초 정도 머문 후 숨을 뱉으면서 무릎과 등을 세우면서 허리를 올려 일어선다.'),
                      ]),
                    ),
                  ),
                )),
                OutlinedButton(
                    onPressed: () {
                      print(widget.count);
                      onSelectS(
                        context: context,
                        modelName: 'posenet',
                        count: widget.count,
                      );
                    },
                    child: Text(
                      'START   >',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
        ]));
  }

  void onSelectS({BuildContext context, String modelName, int count}) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PoseSquat(
          cameras: cameras,
          title: modelName,
          count: count,
        ),
      ),
    );
  }
}
