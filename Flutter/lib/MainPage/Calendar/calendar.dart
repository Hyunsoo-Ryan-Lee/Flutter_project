import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/MainPage/Calendar/event.dart';
import 'package:flutter_auth/MainPage/Food/food_cam.dart';
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
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    // ]);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calendar",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blueAccent[100],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TableCalendar(
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
                    print(focusedDay);
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
                // ignore: sdk_version_ui_as_code
                ..._getEventsfromDay(selectedDay).map(
                  (Event event) => ListTile(
                    title: Text(
                      event.title,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  child: Column(children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Food_Camera()));
                      },
                      child: Text(
                        '오늘 식단 등록하기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(190, 20),
                        primary: Colors.black,
                        side: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => trainMain()));
                      },
                      child: Text(
                        '오늘의 트레이닝',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(190, 20),
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
        ));
  }
}
