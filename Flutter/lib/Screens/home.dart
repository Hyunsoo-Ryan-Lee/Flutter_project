import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> user) {
          if (user.data == null) {
            return SignUp();
          } else {
            return Login();
          }
        });
  }
}
