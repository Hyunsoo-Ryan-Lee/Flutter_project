import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Bottom_navbar.dart';
// import 'package:flutter_auth/MainPage/BMI/sex_select.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 앱이 사용할 수 있는 화면의 크기를 정의
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 15,
            ),
            Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
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
              height: 5,
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
            Container(
              height: 10.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: size.width * 0.3,
                      right: size.width * 0.3,
                      top: size.width * 0.025,
                      bottom: size.width * 0.025),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              child: Text(
                "LOGIN",
                style: new TextStyle(
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
            // SizedBox(height: size.height * 0.03),
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
    );
  }

  void _login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      final snackBar = SnackBar(
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
