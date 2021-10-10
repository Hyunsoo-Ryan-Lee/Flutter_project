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
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'REPORT',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${widget.data}'),
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
    var now = new DateTime.now();
    var formatter = new DateFormat('MM-dd');
    String yesyes = formatter.format(now.subtract(Duration(days: 2)));
    String yesterday = formatter.format(now.subtract(Duration(days: 1)));
    String today = formatter.format(now);
    String tommorrow = formatter.format(now.add(Duration(days: 1)));
    String tommtomm = formatter.format(now.add(Duration(days: 1)));
    var fcal = int.parse('${widget.data[0]}');
    var fcarboh = int.parse('${widget.data[1]}');
    var fprotein = int.parse('${widget.data[2]}');
    var ffat = int.parse('${widget.data[3]}');
    final List<ExpenseData> chartData = [
      ExpenseData('$yesyes', 50, 54, 33),
      ExpenseData('$yesterday', 33, 45, 54),
      ExpenseData('$today', fcarboh, fprotein, ffat),
      ExpenseData('$tommorrow', 32, 54, 23),
      ExpenseData('$tommtomm', 56, 18, 43),
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
