import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class JsonTable extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JSON',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: FoodJson(),
    );
  }
}

class FoodJson extends StatefulWidget {
  @override
  _FoodJsonState createState() => _FoodJsonState();
}

class _FoodJsonState extends State<FoodJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<ProductDataModel>;
          return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image(
                            image:
                                NetworkImage(items[index].imageURL.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(items[index].price.toString()),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/mJson.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}

class ProductDataModel {
  int id;
  String name;
  String category;
  String imageURL;
  String oldPrice;
  String price;

  ProductDataModel(
      {this.id,
      this.name,
      this.category,
      this.imageURL,
      this.oldPrice,
      this.price});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }
}
  // Widget _tableView() {
  //   if (_image == null) {
  //     return Text('');
  //   } else {
  //     return Table(
  //         border: TableBorder
  //             .all(), // Allows to add a border decoration around your table
  //         children: [
  //           TableRow(children: [
  //             Text('음식 이름'),
  //             Text('음식 중량'),
  //             Text('칼로리'),
  //             Text('탄수화물'),
  //             Text('단백질'),
  //             Text('지방'),
  //           ]),
  //           TableRow(children: [
  //             Text(
  //               '2011',
  //             ),
  //             Text('Dart'),
  //             Text('Lars Bak'),
  //             Text('Lars Bak'),
  //             Text('Lars Bak'),
  //             Text('Lars Bak'),
  //           ]),
  //           TableRow(children: [
  //             Text('1996'),
  //             Text('Java'),
  //             Text('James Gosling'),
  //             Text('Lars Bak'),
  //             Text('Lars Bak'),
  //             Text('Lars Bak'),
  //           ]),
  //         ]);
  //   }
  // }