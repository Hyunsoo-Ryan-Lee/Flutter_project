import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportChart extends StatefulWidget {
  var data;
  ReportChart({Key mykey, this.data}) : super(key: mykey);

  final String title = '';

  @override
  _ReportChartState createState() => _ReportChartState();
}

class _ReportChartState extends State<ReportChart> {
  List<ExpenseData> _chartData;
  TooltipBehavior _tooltipBehavior;

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
            // Text('${widget.data}'),
            Container(
              height: size.height * 0.7,
              width: size.width * 0.85,
              child: SfCartesianChart(
                title: ChartTitle(
                    text: '영양정보',
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

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      for (int i = 0; i < widget.data[0].length; i++)
        ExpenseData('${widget.data[0][i]}', widget.data[2][i], 54, 33),
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

  // Widget tt() {
  //   if (widget.data == null)
  // }
}

class ExpenseData {
  ExpenseData(this.expenseCategory, this.father, this.mother, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num daughter;
}
