import 'package:flutter/material.dart';
import 'package:presentation/examples/Container.dart';
import 'package:presentation/examples/bottomnavigation.dart';
import 'package:presentation/examples/button.dart';
import 'package:presentation/examples/card.dart';
import 'package:presentation/examples/column.dart';
import 'package:presentation/examples/gridview.dart';
import 'package:presentation/examples/image.dart';
import 'package:presentation/examples/listview.dart';
import 'package:presentation/examples/row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Basic Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => column()));
                    },
                    child: Text(
                      'Column',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => row()));
                    },
                    child: Text(
                      'Row',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => container()));
                    },
                    child: Text(
                      'Container',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => listview()));
                    },
                    child: Text(
                      'ListView',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => gridview()));
                    },
                    child: Text(
                      'GridView',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bottomnavbar()));
                    },
                    child: Text(
                      'BottomNavigationBar',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => card()));
                    },
                    child: Text(
                      'Card',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => buttons()));
                    },
                    child: Text(
                      'Button',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => image()));
                    },
                    child: Text(
                      'Image',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 10),
                        backgroundColor: Colors.black54),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
