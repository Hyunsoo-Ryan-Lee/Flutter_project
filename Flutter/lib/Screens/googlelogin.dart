import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApp extends StatefulWidget {
  @override
  _GoogleSignInAppState createState() => _GoogleSignInAppState();
}

class _GoogleSignInAppState extends State<GoogleSignInApp> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount user = _googleSignIn.currentUser;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          OutlinedButton(
              onPressed: () async {
                await _googleSignIn.signIn();
                setState(() {});
              },
              child: Text('로그인')),
          OutlinedButton(
              onPressed: () async {
                await _googleSignIn.signOut();
                setState(() {});
              },
              child: Text('로그아웃'))
        ],
      )),
    );
  }
}
