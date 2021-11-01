import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Calendar/calendar.dart';
import 'package:flutter_auth/MainPage/Food/chart/visual.dart';
import 'package:flutter_auth/MainPage/Food/my_diet.dart';
import 'package:flutter_auth/MainPage/Food/chart/chart_main.dart';
import 'package:flutter_auth/MainPage/Mypage/mypage_main.dart';
import 'package:flutter_auth/MainPage/Training/training_main.dart';
import 'package:flutter_auth/MainPage/testpage.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    var _selectedidx = 0;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedidx,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.date_range)),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(icon: Icon(Icons.directions_run_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Calendar(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: myDiet(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: VisualData());
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: TrainMain(),
                );
              },
            );
          case 4:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: myPage(),
                );
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Calendar(),
                );
              },
            );
        }
      },
    );
  }
}
