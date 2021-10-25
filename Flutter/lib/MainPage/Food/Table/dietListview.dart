import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Bottom_navbar.dart';

class DietListview extends StatefulWidget {
  final List data;
  const DietListview({Key mykey, this.data}) : super(key: mykey);

  @override
  _DietListviewState createState() => _DietListviewState();
}

class _DietListviewState extends State<DietListview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Diet Listview',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0.0,
              backgroundColor: Colors.blueAccent[100],
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                // Text('${widget.data}'),
                for (int i = widget.data[0].length - 1; i >= 0; i--)
                  ListTile(
                    title:
                        Text("${widget.data[0][i]}     ${widget.data[1][i]}"),
                    subtitle: Text(
                        "음식 : ${widget.data[2][i]}  칼로리 : ${widget.data[3][i]} kcal"),
                    leading: Icon(Icons.food_bank),
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
