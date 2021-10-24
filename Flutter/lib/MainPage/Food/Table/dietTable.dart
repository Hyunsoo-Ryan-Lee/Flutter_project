import 'package:flutter/material.dart';

class DietTable extends StatefulWidget {
  final List data;
  const DietTable({Key mykey, this.data}) : super(key: mykey);

  @override
  _DietTableState createState() => _DietTableState();
}

class _DietTableState extends State<DietTable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Diet Table',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('${widget.data}'),
            Container(
              child: Table(
                  border: TableBorder.all(color: Colors.black),
                  columnWidths: {
                    0: FixedColumnWidth(70.0),
                    1: FixedColumnWidth(36.0),
                    2: FixedColumnWidth(70.0),
                    3: FixedColumnWidth(40.0),
                    4: FixedColumnWidth(60.0),
                    5: FixedColumnWidth(40.0),
                    6: FixedColumnWidth(40.0)
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        '날짜',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '시간',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '음식명',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '칼로리',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '탄수화물',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '단백질',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '지방',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                    for (int i = 0; i < widget.data[0].length; i++)
                      TableRow(children: [
                        Text(
                          widget.data[0][i],
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[1][i],
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[2][i],
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[3][i].toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[4][i].toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[5][i].toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.data[6][i].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ])
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
