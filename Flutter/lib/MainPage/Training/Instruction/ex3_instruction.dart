import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/pose/Pose_JumpSquat.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/pose/Pose_Lunge.dart';
import 'package:flutter_auth/main.dart';

class Instruction_3 extends StatefulWidget {
  int count;
  Instruction_3({Key mykey, this.count}) : super(key: mykey);
  @override
  State<Instruction_3> createState() => _Instruction_3State();
}

class _Instruction_3State extends State<Instruction_3> {
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
                          image: AssetImage('assets/gif/lunge.gif'))),
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
                            '1. 엉덩이 넓이로 다리를 벌리고 선 후 상체를 펴고 코어에 힘을 주고 손을 앞으로 모아준다.\n'),
                        Text(
                            '2. 오른쪽 다리를 뻗어 한 걸을 나아가면서 두 무릎이 90도를 이룰 때까지 엉덩이를 낮추어준다.\n'),
                        Text(
                            '3. 다시 다리를 펴주면서 오른쪽 다리를 다시 몸 쪽으로 끌어당겨 원래의 자세가 될 수 있도록 해준다.\n'),
                        Text('4. 반대편 다리도 동일한 방법으로 앞으로 내딛고 모아주며 이 동작을 반복한다.'),
                      ]),
                    ),
                  ),
                )),
                OutlinedButton(
                    onPressed: () {
                      onSelectL(
                        context: context,
                        modelName: 'posenet',
                        count: widget.count,
                      );
                    },
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

  void onSelectL({BuildContext context, String modelName, int count}) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PoseLunge(
          cameras: cameras,
          title: modelName,
          count: count,
        ),
      ),
    );
  }
}
