import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Bottom_navbar.dart';

class TrainListview extends StatefulWidget {
  final List data;
  const TrainListview({Key mykey, this.data}) : super(key: mykey);

  @override
  _TrainListviewState createState() => _TrainListviewState();
}

class _TrainListviewState extends State<TrainListview> {
  Map<String, String> Exercise = {
    'E1': 'Arm-Press',
    'E2': 'Jump-Squat',
    'E3': 'Lunge',
    'E4': 'Squat'
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                '${widget.data[3]} 일치 운동 기록',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                for (int i = widget.data[0].length - 1; i >= 0; i--)
                  ListTile(
                    title: Text("${widget.data[0][i]}"),
                    subtitle: Text(
                        "운동명 : ${Exercise[widget.data[1][i]]}     횟수 : ${widget.data[2][i]} 회"),
                    leading: Icon(Icons.fitness_center),
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text('영양 정보'),
                      //         content: SingleChildScrollView(
                      //           child: ListBody(
                      //             children: [
                      //               Padding(padding: EdgeInsets.all(10.0)),
                      //               GestureDetector(
                      //                 child: Text(
                      //                     '탄수화물 : ${widget.data[4][i]} g\n단백질 : ${widget.data[5][i]} g\n지방 : ${widget.data[6][i]} g'),
                      //                 onTap: () {},
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
              ],
            )));
  }

  Widget testtest() {
    for (int i = widget.data[0].length - 1; i >= 0; i--) {
      if ('${widget.data[1][i]}' == '아침') {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: [
            ListTile(
              title: Text("${widget.data[0][i]}     ${widget.data[1][i]}"),
              subtitle: Text(
                  "음식 : ${widget.data[2][i]}  칼로리 : ${widget.data[3][i]} kcal"),
              leading: Icon(Icons.running_with_errors),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('영양 정보'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Padding(padding: EdgeInsets.all(10.0)),
                              GestureDetector(
                                child: Text(
                                    '탄수화물 : ${widget.data[4][i]} g\n단백질 : ${widget.data[5][i]} g\n지방 : ${widget.data[6][i]} g'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        );
      } else if ('${widget.data[1][i]}' == '점심') {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: [
            ListTile(
              title: Text("${widget.data[0][i]}     ${widget.data[1][i]}"),
              subtitle: Text(
                  "음식 : ${widget.data[2][i]}  칼로리 : ${widget.data[3][i]} kcal"),
              leading: Icon(Icons.lunch_dining),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('영양 정보'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Padding(padding: EdgeInsets.all(10.0)),
                              GestureDetector(
                                child: Text(
                                    '탄수화물 : ${widget.data[4][i]} g\n단백질 : ${widget.data[5][i]} g\n지방 : ${widget.data[6][i]} g'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        );
      } else {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: [
            ListTile(
              title: Text("${widget.data[0][i]}     ${widget.data[1][i]}"),
              subtitle: Text(
                  "음식 : ${widget.data[2][i]}  칼로리 : ${widget.data[3][i]} kcal"),
              leading: Icon(Icons.dinner_dining),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('영양 정보'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Padding(padding: EdgeInsets.all(10.0)),
                              GestureDetector(
                                child: Text(
                                    '탄수화물 : ${widget.data[4][i]} g\n단백질 : ${widget.data[5][i]} g\n지방 : ${widget.data[6][i]} g'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        );
      }
    }
  }
}
