import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/BMI/BMI_men.dart';
import 'package:flutter_auth/MainPage/BMI/BMI_women.dart';
import 'package:flutter_auth/MainPage/BMI/sex_select.dart';
// import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String address = 'http://3.38.2.230:8000/member/register';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.05,
                ),
                Text(
                  "Sign up with Email",
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
                    "SIGN UP",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      _register(context);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                      press: () {
                        // var route = new MaterialPageRoute(
                        //   builder: (BuildContext context) => new BMImen(txt: [
                        //     _emailController.text,
                        //     _passwordController.text
                        //   ]),
                        // );
                        // Navigator.of(context).push(route);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> sendMailPass(List title) {
    return http.post(
      Uri.parse(address),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'UUID': title[0], 'UPW': title[1]}),
    );
  }

  void _register(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      var route = new MaterialPageRoute(
          builder: (BuildContext context) => new selectSex(
              txt: [_emailController.text, _passwordController.text]));
      Navigator.of(context).push(route);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final snackBar = SnackBar(
          content: const Text("비밀번호는 6자 이상 입력해주세요"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        final snackBar = SnackBar(
          content: const Text("이미 사용중인 Email입니다."),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    //     final result =
    // final user = result.user;

//     if (user == null) {
//       final snackbar = SnackBar(
//         content: Text("Wrong Account."),
//         duration: Duration(seconds: 2),
//       );
//       Scaffold.of(context).showSnackBar(snackbar);
//     }
  }
}
