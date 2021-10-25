import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Mypage/EachPage/github.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:url_launcher/url_launcher.dart';

class myPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My page',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(title: '설정', children: [
              myInfo(),
              introduction(context),
              sendFeedback(),
              buildLogout(context)
            ])
          ],
        ),
      ),
    );
  }

  Widget myInfo() => SimpleSettingsTile(
        title: '내 정보 관리',
        subtitle: '',
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        onTap: () {},
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
          // Navigator.of(context)
          //     .pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage()));
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
}
