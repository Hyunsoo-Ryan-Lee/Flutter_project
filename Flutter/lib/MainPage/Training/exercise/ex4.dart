import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/Instruction/ex4_instruction.dart';

class Ex_4 extends StatefulWidget {
  @override
  _Ex_4State createState() => _Ex_4State();
}

class _Ex_4State extends State<Ex_4> {
  TextEditingController _passwordController;

  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    setState(() {
      if (_passwordController.text.length < 1) {
        isPasswordValid = false;
      } else {
        isPasswordValid = true;
      }
    });
  }

  UnderlineInputBorder borderMaker(Color color) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      onChanged: (_) {
        _validatePassword();
      },
      onSubmitted: (String value) {
        print("password: $value");
        _validatePassword();
      },
      decoration: InputDecoration(
          border: borderMaker(Colors.black),
          errorBorder: borderMaker(Colors.red),
          errorText: isPasswordValid ? null : "횟수를 입력해주세요"),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'SQUAT',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.blueAccent[100],
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/squat.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: SizedBox(
                          width: size.width * 0.35,
                          child: _buildPasswordTextField(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '회',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (_passwordController.text.length >= 1) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Instruction_4(
                                      count: int.parse(
                                          _passwordController.text))));
                        } else {}
                      },
                      child: Text(
                        'START  >',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(120, 15),
                        primary: Colors.black,
                        side: BorderSide(width: 1, color: Colors.black),
                      ))
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
