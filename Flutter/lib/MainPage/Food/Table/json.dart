// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'dart:async' show Future;
// import 'package:flutter/services.dart';
// import 'dart:convert';

// class JsonTable extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'JSON',
//           style: TextStyle(color: Colors.black),
//         ),
//         elevation: 0.0,
//         backgroundColor: Colors.blueAccent[100],
//         centerTitle: true,
//       ),
//       body: ReadJson(),
//     );
//   }
// }

// class ReadJson extends StatefulWidget {
//   @override
//   _ReadJsonState createState() => _ReadJsonState();
// }

// class _ReadJsonState extends State<ReadJson> {
//   List _items = [];
//   Future<void> readJson() async {
//     final String response =
//         await rootBundle.rootBundle.loadString('assets/json/mJson.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["items"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     readJson();
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: DataTable2(
//           columnSpacing: 1,
//           horizontalMargin: 12,
//           columns: [
//             DataColumn2(
//               label: Text(
//                 '음식명',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.M,
//             ),
//             DataColumn2(
//               label: Text(
//                 '섭취량',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.M,
//             ),
//             DataColumn2(
//               label: Text(
//                 '칼로리',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.M,
//             ),
//             DataColumn2(
//               label: Text(
//                 '탄수화물',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.L,
//             ),
//             DataColumn2(
//               label: Text(
//                 '단백질',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.M,
//             ),
//             DataColumn2(
//               label: Text(
//                 '지방',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               size: ColumnSize.M,
//             ),
//           ],
//           rows: List<DataRow>.generate(
//               _items.length,
//               (index) => DataRow(cells: [
//                     DataCell(Text(_items[index]["FNAME"])),
//                     DataCell(Text(_items[index]["CAL"])),
//                     DataCell(Text(_items[index]["CARBOH"])),
//                     DataCell(Text(_items[index]["PROTEIN"])),
//                     DataCell(Text(_items[index]["FAT"])),
//                     DataCell(Text(_items[index]["AMOUNT"])),
//                   ]))),
//     );
//   }
// }
