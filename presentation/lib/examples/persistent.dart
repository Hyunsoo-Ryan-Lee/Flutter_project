import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';

class navbar extends StatelessWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedidx = 0;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedidx,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.camera)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Page1(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Page2(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Page3(),
                );
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Page1(),
                );
              },
            );
        }
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Center(
        child: Container(
          // height: 200,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: [
              Card(
                color: Colors.teal,
              ),
              Card(
                color: Colors.cyan,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.deepOrange,
              ),
              Card(
                color: Colors.red,
              ),
              Card(
                color: Colors.yellow,
              ),
              Card(
                color: Colors.purpleAccent,
              ),
              Card(
                color: Colors.indigo,
              ),
              Card(
                color: Colors.black,
              ),
              Card(
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Card Example"),
      ),
      body: Container(
        width: 250,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.brown,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title:
                      Text('Desperado', style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('EAGLES', style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[],
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

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Button Example"),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused)) return Colors.red;
                return null; // Defer to the widget's default.
              }),
            ),
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => other()));
            },
            child: Text('TextButton'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            child: Text('ElevatedButton'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.grey),
            ),
            onPressed: () {},
            child: Text('OutlinedButton'),
          )
        ]),
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Row Example"),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "React.js",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "Flutter",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.green),
              child: Text(
                "MySQL",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
              ),
            )
          ]),
    );
  }
}

class other extends StatelessWidget {
  const other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.grey),
            ),
            onPressed: () {
              // Navigator.push(
              //     context, CupertinoPageRoute(builder: (context) => Page1()));
              // Navigator.pop(context);
            },
            child: Text('페이지 나가기'),
          ),
          Text("안녕하세요!"),
        ],
      ),
    );
  }
}
