import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Calendar/event.dart';
import 'package:flutter_auth/MainPage/Food/food_cam.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex1.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex2.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex3.dart';
import 'package:flutter_auth/MainPage/Training/exercise/ex4.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  Random rnd = new Random();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.teal[200],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                height: size.height * 0.55,
                child: TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,

                  //Day Changed
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                    print(focusedDay.month);
                    print(focusedDay.day);
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },

                  eventLoader: _getEventsfromDay,

                  //To style the Calendar
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // ..._getEventsfromDay(selectedDay).map(
              //   (Event event) => ListTile(
              //     title: Text(
              //       event.title,
              //     ),
              //   ),
              // ),
              Container(
                child: Column(children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FoodCamera()));
                    },
                    child: Text(
                      '오늘 식단 등록하기',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      primary: Colors.black,
                      side: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      randomTrain();
                    },
                    child: Text(
                      '랜덤 트레이닝',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      primary: Colors.black,
                      side: BorderSide(width: 1, color: Colors.black),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: size.height * 0.03,
              )
            ]),
          ),
        ));
  }

  Widget randomTrain() {
    int randnumber = 1 + rnd.nextInt(4);
    if (randnumber == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Ex_1()));
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: const Text("Arm Press에 당첨되셨습니다."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (randnumber == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Ex_2()));
      final snackBar = SnackBar(
          duration: const Duration(milliseconds: 1000),
          content: const Text('Jump Squat에 당첨되셨습니다.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (randnumber == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Ex_3()));
      final snackBar = SnackBar(
          duration: const Duration(milliseconds: 1000),
          content: const Text('Lunge에 당첨되셨습니다.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Ex_4()));
      final snackBar = SnackBar(
          duration: const Duration(milliseconds: 1000),
          content: const Text('Squat에 당첨되셨습니다.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
