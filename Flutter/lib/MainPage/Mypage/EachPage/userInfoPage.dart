import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInfoPage extends StatefulWidget {
  final List userdata;
  const UserInfoPage({Key mykey, this.userdata}) : super(key: mykey);
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  TextEditingController _actcontroller = TextEditingController();

  var check;
  final _picker = ImagePicker();
  File _image;
  int userage;
  bool nullcheck = false;
  // double userheight;
  // double userweight;
  // String useract;
  // double usercal;
  int temp1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    userage = widget.userdata[1];

    // double userheight = widget.userdata[2];
    // double userweight = widget.userdata[3];
    // String useract = widget.userdata[4];
    // double usercal = widget.userdata[5];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '사용자 정보',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                // SizedBox(
                //   height: size.height * 0.05,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(children: [
                    ClipOval(
                      child: _imageView(),
                      // child: Image.asset(
                      //   "assets/images/user.png",
                      //   height: 100,
                      //   width: 100,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          child: ClipOval(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              color: Colors.white,
                              child: ClipOval(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  color: Colors.grey,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            _showDialog(context);
                            print('하하');
                          },
                        )),
                  ]),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text('${widget.userdata[0]}'),

                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: size.width * 0.1),
                        Row(
                          children: [
                            Text('나    이',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Text('$userage 세'),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: size.width * 0.1),
                        Row(
                          children: [
                            Text('신    장',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Text('${widget.userdata[2]} cm'),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: size.width * 0.1),
                        Row(
                          children: [
                            Text('몸무게',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Text('${widget.userdata[3]} Kg'),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: size.width * 0.1),
                        Row(
                          children: [
                            Text('활동량',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Text('${widget.userdata[4]}'),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: size.width * 0.1),
                        Row(
                          children: [
                            Text('권장 칼로리',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              width: size.width * 0.1,
                            ),
                            Text('${widget.userdata[5]} Kcal'),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(height: size.height * 0.05),
                TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      ModifyPersonalInfo(context);
                    },
                    child: Text('개인정보 수정'))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallary'),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _openGallary(BuildContext context) async {
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 5);
    if (image != null) {
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
      Navigator.of(context).pop();
      // uploadImage();
    }
    try {
      String filename = image.path.split('/').last;
      FormData formdata = new FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType('image', 'png')),
        'type': 'image/png'
      });
    } catch (e) {
      print(e);
    }
  }

  Future _openCamera(BuildContext context) async {
    try {
      final photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        File croppedFile = await ImageCropper.cropImage(
            sourcePath: photo.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              minimumAspectRatio: 1.0,
            ));

        final photoTemp = File(croppedFile.path);
        setState(() => this._image = photoTemp);
        Navigator.of(context).pop();
        // uploadImage();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget _imageView() {
    if (_image == null) {
      return Image.asset(
        "assets/images/user.png",
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      );
    } else {
      return ClipOval(
        child: Image.file(
          _image,
          width: 100,
          height: 100,
        ),
      );
    }
  }

  final _valuelist = [
    '주로 좌식 생활',
    '주 1~3일 운동',
    '주 3~5일 운동',
    '거의 매일 운동',
    '매일 강도높게 운동'
  ];
  String dropdownValue = '주로 좌식 생활';
  String holder = '';
  double activation = 0;
  String result = '';

  sendModifiedData() async {
    print('데이터 전송 시작');
    http.Response response = await http.post(
      Uri.parse('http://' + address + '/member/userinfo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uuid': uuid,
        'uage': int.parse(_agecontroller.value.text),
        'uheight': int.parse(_heightcontroller.value.text),
        'uweight': int.parse(_weightcontroller.value.text),
        'uact': dropdownValue,
        'urdc': result
      }),
    );
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(resJson);
    }
    setState(() {});
  }

  void calculateBmi(int age, double height, double weight) {
    if (dropdownValue == '주로 좌식 생활') {
      activation = 1.2;
    } else if (dropdownValue == '주 1~3일 운동') {
      activation = 1.3;
    } else if (dropdownValue == '주 3~5일 운동') {
      activation = 1.5;
    } else if (dropdownValue == '거의 매일 운동') {
      activation = 1.7;
    } else {
      activation = 1.9;
    }
    double finalresult =
        (66 + (13.7 * weight) + (5 * height) - (6.5 * age)) * activation;
    String bmi = finalresult.toStringAsFixed(0);
    setState(() {
      result = bmi;
    });
  }

  Future<void> ModifyPersonalInfo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '개인정보 수정',
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: ListBody(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text('나이',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        controller: _agecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '나이를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                          '신장',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        controller: _heightcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '키를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text('몸무게',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        controller: _weightcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '몸무게를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('활동량')),
                            _DayTime()
                          ],
                        )),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            calculateBmi(
                                int.parse(_agecontroller.value.text),
                                double.parse(_heightcontroller.value.text),
                                double.parse(_weightcontroller.value.text));
                            // sendModifiedData();
                            print([
                              int.parse(_agecontroller.value.text),
                              _heightcontroller.value.text,
                              _weightcontroller.value.text,
                              dropdownValue,
                              result
                            ]);
                            _agecontroller.clear();
                            _heightcontroller.clear();
                            _weightcontroller.clear();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('조회'))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _DayTime() {
    return DropdownButton(
      value: dropdownValue,
      onChanged: (String newValue) {
        getDropDownItem();
        setState(() {
          dropdownValue = newValue;
          print(dropdownValue);
        });
      },
      items: _valuelist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      elevation: 4,
      icon: const Icon(Icons.arrow_drop_down_rounded),
    );
  }

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }
}
