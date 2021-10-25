import 'package:flutter/material.dart';
import 'package:flutter_auth/MainPage/Training/Instruction/ex1_instruction.dart';

// class Ex_1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setPreferredOrientations([
//     //   DeviceOrientation.portraitDown,
//     //   DeviceOrientation.portraitUp,
//     // ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: Exercise_1(),
//         ),
//       ),
//     );
//   }
// }

class Ex_1 extends StatefulWidget {
  @override
  _Ex_1State createState() => _Ex_1State();
}

class _Ex_1State extends State<Ex_1> {
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
        // print("password: $value");
        _validatePassword();
      },
      // onEditingComplete: () {
      //   _showAlertDialog(context);
      // },
      decoration: InputDecoration(
          border: borderMaker(Colors.black),
          // labelText: "Password",
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
            'JUMP SQUAT',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.blueAccent[100],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              Expanded(
                child: Column(children: [
                  Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/jumpsquat.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
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
                          // TextField(
                          //   controller: _ex1controller,
                          //   onChanged: (_) {
                          //     _validateEx1();
                          //   },
                          //   onSubmitted: (String value) {
                          //     print('password: $value');
                          //     _validateEx1();
                          //   },
                          //   textAlign: TextAlign.center,
                          //   decoration: InputDecoration(
                          //     labelText: isInputValid ? null : '횟수를 입력하세요',
                          //     focusedBorder: UnderlineInputBorder(),
                          //     fillColor: Colors.grey[200],
                          //     // errorText: isInputValid ? '횟수를 입력해주세요' : null
                          //   ),
                          // ),
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
                        // _portraitModeOnly();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Instruction_1()));
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
            ],
          ),
        ),
      ),
    );
  }
}
