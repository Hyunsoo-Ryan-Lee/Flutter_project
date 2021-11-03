import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Mypage/EachPage/userInfoPage.dart';
import 'package:flutter_auth/MainPage/Mypage/EachPage/github.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class myPage extends StatefulWidget {
  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal[200],
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(title: '', children: [
              myInfo(context),
              introduction(context),
              sendFeedback(),
              buildLogout(context)
            ])
          ],
        ),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String uuid = '';
  void GetUserId() {
    final User user = auth.currentUser;
    uuid = user.email;
  }

  _navigatetoUserManage() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserInfoPage(
                userdata: [uuid, age, height, weight, activity, urdc])));
  }

  int age;
  double height;
  double weight;
  String activity;
  double urdc;
  sendUserInfo() async {
    var queryParams = {'uuid': uuid};
    final uri = Uri.http(address, '/member/userinfo', queryParams);
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
    final response = await http.get(uri, headers: headers);
    // http.Response response = await http.post(
    //   Uri.parse(address),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode({'uuid': uuid}),
    // );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(resJson);
      age = resJson['uage'];
      height = resJson['uheight'];
      weight = resJson['uweight'];
      activity = resJson['uact'];
      urdc = resJson['urdc'];
    }
    setState(() {});
  }

  Widget myInfo(BuildContext context) => SimpleSettingsTile(
        title: '내 정보 관리',
        subtitle: '',
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        onTap: () {
          GetUserId();
          sendUserInfo();
          _navigatetoUserManage();
        },
      );

  Widget introduction(BuildContext context) => SimpleSettingsTile(
        title: '개발진 소개',
        subtitle: '',
        leading: Icon(
          Icons.groups,
          color: Colors.blueAccent,
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Github()));
        },
      );

  Widget sendFeedback() => SimpleSettingsTile(
        title: '피드백 보내기',
        subtitle: '',
        leading: Icon(
          Icons.mail,
          color: Colors.blueAccent,
        ),
        onTap: () async {
          _launchEmail();
          // final toEmail = 'hyunsoo@gmail.com';
          // final subject = 'hello';
          // final message = 'good';
          // final url =
          //     'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
          // if (await canLaunch(url)) {
          //   await launch(url);
          // }
        },
      );

  Widget buildLogout(BuildContext context) => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: Icon(
          Icons.logout,
          color: Colors.redAccent,
        ),
        onTap: () {
          // makeRoutePage(context: context, pageRef: WelcomePage());
        },
      );

  _launchEmail() {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'haiapp@encore.com', query: 'good'
            // query: encodeQueryParameters(<String, String>{
            //   'subject': 'Example Subject & Symbols are allowed!'
            // }
            );

    launch(emailLaunchUri.toString());
  }

  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }
}
