import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex1.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex2.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex3.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex4.dart';

// ignore: camel_case_types
class trainMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    // ]);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Training',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(children: [
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icons/situp.png'),
                                fit: BoxFit.contain)),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ex_1()));
                          },
                          child: Text(
                            'SIT-UP  >',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(120, 15),
                            primary: Colors.black,
                            side: BorderSide(width: 1, color: Colors.black),
                          ))
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icons/lunge.png'),
                                fit: BoxFit.contain)),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ex_3()));
                          },
                          child: Text(
                            'LUNGE  >',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(120, 15),
                            primary: Colors.black,
                            side: BorderSide(width: 1, color: Colors.black),
                          ))
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(children: [
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icons/pushup.png'),
                                fit: BoxFit.contain)),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ex_2()));
                          },
                          child: Text(
                            'PUSH-UP  >',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(120, 15),
                            primary: Colors.black,
                            side: BorderSide(width: 1, color: Colors.black),
                          ))
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icons/squat.jpg'),
                                fit: BoxFit.contain)),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ex_4()));
                          },
                          child: Text(
                            'SQUAT  >',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(120, 15),
                            primary: Colors.black,
                            side: BorderSide(width: 1, color: Colors.black),
                          ))
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
