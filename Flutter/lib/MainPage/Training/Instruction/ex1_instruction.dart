import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/Pose_Model.dart';
import 'package:flutter_auth/main.dart';

class Instruction_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'INSTRUCTION',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.blueAccent[100],
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
                          image: AssetImage('assets/gif/situp.gif'))),
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
                        Text(
                            '1. 매트리스처럼 부드러운 표면에 누워 90도 각도로 무릎을 구부리고 발을 바닥에 고르게 대어준다.\n'),
                        Text(
                            '2. 손으로 귀 뒤를 동그랗게 모아서 받쳐주고 팔꿈치를 구부려서 팔꿈치가 바깥쪽을 바라보도록 한다.\n'),
                        Text(
                            '3. 발은 바닥에 붙인 상태로 몸통을 올려서 허리 아래쪽이 바닥에서 떨어질 수 있도록 한다.\n'),
                        Text(
                            '4. 몸통을 올릴 때와 마찬가지로, 허벅지에 힘을 주고 부드럽고 안정적으로 몸통의 위치를 낮춰준다.'),
                      ]),
                    ),
                  ),
                )),
                OutlinedButton(
                    onPressed: () =>
                        onSelectA(context: context, modelName: 'posenet'),
                    child: Text(
                      'GO!!   >',
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

  void onSelectA({BuildContext context, String modelName}) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pose_armpress(
          cameras: cameras,
          title: modelName,
        ),
      ),
    );
  }
}
