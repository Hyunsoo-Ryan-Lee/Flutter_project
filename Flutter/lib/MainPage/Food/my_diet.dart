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
      body: Column(
        children: [
          Text('$data'),
        ],
      ),
    );
  }
}
