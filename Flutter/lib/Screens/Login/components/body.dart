import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Bottom_navbar.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 앱이 사용할 수 있는 화면의 크기를 정의
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.05,
              ),
              Text(
                "Login with Email",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                          ))),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input correct Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                          ))),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input correct Password';
                    } else if (value.length < 6) {
                      return 'p/w는 최소 6자 이상입니다.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _login(context);
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  void _login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        content: const Text("환영합니다!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigator()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        final snackBar = SnackBar(
          content: const Text("확인되지 않은 Email입니다."),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        final snackBar = SnackBar(
          content: const Text("비밀번호가 틀렸습니다."),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('Wrong password provided for that user.');
      }
    }
  }
}
