import 'package:flutter/material.dart';

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

class myDiet extends StatelessWidget {
  final List data;
  const myDiet({Key mykey, this.data}) : super(key: mykey);

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
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('3일'),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('7일'),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('15일'),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('한 달'),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),
                  GestureDetector(
                    child: Text('기타'),
                    onTap: () {
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
                  TextButton(onPressed: () {}, child: Text('조회'))
                ],
              ),
            ),
          );
        });
  }
}
