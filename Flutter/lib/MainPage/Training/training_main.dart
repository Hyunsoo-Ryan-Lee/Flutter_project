import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex1.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex2.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex3.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex4.dart';

class TrainMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                Container(
                  height: size.height * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Column(children: [
                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/shoulder.png'),
                                        fit: BoxFit.contain)),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Ex_1()));
                                  },
                                  child: Text(
                                    'ARM-PRESS  >',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(140, 15),
                                    primary: Colors.black,
                                    side: BorderSide(
                                        width: 1, color: Colors.black),
                                  ))
                            ]),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Column(children: [
                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/lunge.png'),
                                        fit: BoxFit.contain)),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Ex_3()));
                                  },
                                  child: Text(
                                    'LUNGE  >',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(140, 15),
                                    primary: Colors.black,
                                    side: BorderSide(
                                        width: 1, color: Colors.black),
                                  ))
                            ]),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Column(children: [
                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/jumpsquat.jpg'),
                                        fit: BoxFit.contain)),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Ex_2()));
                                  },
                                  child: Text(
                                    'JUMP-SQUAT  >',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(140, 15),
                                    primary: Colors.black,
                                    side: BorderSide(
                                        width: 1, color: Colors.black),
                                  ))
                            ]),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Column(children: [
                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/squat.jpg'),
                                        fit: BoxFit.contain)),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Ex_4()));
                                  },
                                  child: Text(
                                    'SQUAT  >',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(140, 15),
                                    primary: Colors.black,
                                    side: BorderSide(
                                        width: 1, color: Colors.black),
                                  ))
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
