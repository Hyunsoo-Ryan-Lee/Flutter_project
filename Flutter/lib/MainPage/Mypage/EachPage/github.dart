import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Github extends StatefulWidget {
  @override
  _GithubState createState() => _GithubState();
}

class _GithubState extends State<Github> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          '개발자 정보',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          // height: 200,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: [
              InkWell(
                  onTap: () {
                    _launchUrl('https://github.com/purple-cabbage0030');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/hong.png'),
                  )),
              InkWell(
                  onTap: () {
                    _launchUrl('https://github.com/johnny9210');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/jung.png'),
                  )),
              InkWell(
                  onTap: () {
                    _launchUrl('https://github.com/Hyunsoo-Ryan-Lee');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/hyun.png'),
                  )),
              InkWell(
                  onTap: () {
                    _launchUrl('https://github.com/Henry-choi426');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/choi.png'),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _launchUrl(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
        forceWebView: true,
      );
    } else {
      print("Can\'t Launch Url");
      print("Can\'t Launch Url");
    }
  }
}
