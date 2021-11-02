import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Food/chart/visual.dart';
import 'package:flutter_auth/main.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ReportChartSecond extends StatefulWidget {
  var data;
  ReportChartSecond({Key mykey, this.data}) : super(key: mykey);

  final String title = '';

  @override
  _ReportChartSecondState createState() => _ReportChartSecondState();
}

class _ReportChartSecondState extends State<ReportChartSecond> {
  List<ExpenseData> _chartData;
  TooltipBehavior _tooltipBehavior;
  final _valuelist = ['3일', '7일', '15일', '30일'];
  String dropdownValue = '3일';
  String holder = '';

  @override
  void initState() {
    if (widget.data == null) {
      _chartData = chartDefault();
    } else {
      _chartData = getChartData();
    }
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Report',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(alignment: Alignment.topLeft, child: _DayTime()),
            ),
            Container(
              height: size.height * 0.7,
              width: size.width * 0.85,
              child: SfCartesianChart(
                title: ChartTitle(
                    text: '영양정보(g)',
                    textStyle: TextStyle(fontWeight: FontWeight.bold)),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: _chartData,
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.father,
                      name: '탄수화물',
                      markerSettings: MarkerSettings(
                        isVisible: true,
                      )),
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: _chartData,
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.mother,
                      name: '단백질',
                      markerSettings: MarkerSettings(
                        isVisible: true,
                      )),
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: _chartData,
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.daughter,
                      name: '지방',
                      markerSettings: MarkerSettings(
                        isVisible: true,
                      )),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  List date = [];
  List cal = [];
  List carboh = [];
  List protein = [];
  List fat = [];
  int period = 0;
  sendFoodData() async {
    print('데이터 전송 시작');
    http.Response response = await http.post(
      Uri.parse('http://' + address + '/repository/dietvis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uuid': uuid, 'period': period}),
    );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      date = resJson['diet_datetime'];
      cal = resJson['cal'];
      carboh = resJson['carboh'];
      protein = resJson['protein'];
      fat = resJson['fat'];
      print(resJson);
    }
    setState(() {});
  }

  Widget _DayTime() {
    return DropdownButton(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        if (dropdownValue == '') {
          return '';
        } else if (dropdownValue == '3일') {
          period = 3;
          sendFoodData();
          GetUserId();
          _navigatetograph();
        } else if (dropdownValue == '7일') {
          period = 7;
          sendFoodData();
          GetUserId();
          _navigatetograph();
        } else if (dropdownValue == '15일') {
          period = 15;
          sendFoodData();
          GetUserId();
          _navigatetograph();
        } else {
          period = 30;
          sendFoodData();
          GetUserId();
          _navigatetograph();
        }
      },
      items: _valuelist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      elevation: 4,
      icon: const Icon(Icons.arrow_drop_down_rounded),
    );
  }

  _navigatetograph() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ReportChart(data: [date, cal, carboh, protein, fat, period])));
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      for (int i = 0; i < widget.data[0].length; i++)
        ExpenseData('${widget.data[0][i]}', widget.data[2][i],
            widget.data[3][i], widget.data[4][i]),
    ];
    return chartData;
  }

  List<ExpenseData> chartDefault() {
    var now = new DateTime.now();
    var formatter = new DateFormat('MM-dd');
    String yesyes = formatter.format(now.subtract(Duration(days: 2)));
    String yesterday = formatter.format(now.subtract(Duration(days: 1)));
    String today = formatter.format(now);
    String tommorrow = formatter.format(now.add(Duration(days: 1)));
    String tommtomm = formatter.format(now.add(Duration(days: 1)));

    final List<ExpenseData> chartData = [
      ExpenseData('$yesyes', 0, 0, 0),
      ExpenseData('$yesterday', 0, 0, 0),
      ExpenseData('$today', 0, 0, 0),
      ExpenseData('$tommorrow', 0, 0, 0),
      ExpenseData('$tommtomm', 0, 0, 0),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(this.expenseCategory, this.father, this.mother, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num daughter;
}
