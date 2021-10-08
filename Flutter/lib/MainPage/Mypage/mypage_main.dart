import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

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
              introduction(),
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

  Widget introduction() => SimpleSettingsTile(
        title: '개발진 소개',
        subtitle: '',
        leading: Icon(
          Icons.groups,
          color: Colors.blueAccent,
        ),
        onTap: () {},
      );

  Widget sendFeedback() => SimpleSettingsTile(
        title: '피드백 보내기',
        subtitle: '',
        leading: Icon(
          Icons.mail,
          color: Colors.blueAccent,
        ),
        onTap: () {},
      );
  Widget buildLogout(BuildContext context) => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: Icon(
          Icons.logout,
          color: Colors.redAccent,
        ),
        onTap: () {
          // Navigator.of(context).pop(context);
        },
      );
}
