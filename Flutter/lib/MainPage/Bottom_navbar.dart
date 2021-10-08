import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Calendar/calendar.dart';
import 'package:flutter_auth/MainPage/Food/my_diet.dart';
import 'package:flutter_auth/MainPage/Training/training_main.dart';
import 'package:flutter_auth/MainPage/chart.dart';
import 'package:flutter_auth/MainPage/Mypage/mypage_main.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  var _selectedidx = 0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedidx,
          children: [
            Calendar(),
            myDiet(),
            ReportChart(),
            trainMain(),
            myPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedidx,
          onTap: (value) {
            setState(() {
              _selectedidx = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined), label: "Food"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Chart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_run_rounded), label: "Fit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "MyPage"),
          ],
        ),
      ),
    );
  }
}
