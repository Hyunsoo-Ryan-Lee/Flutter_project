import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png')),
              SizedBox(height: size.height * 0.05),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black38),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    primary: Colors.black,
                    side: BorderSide(width: 3, color: Colors.black38),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
