import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // int userage = widget.userdata[1];
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: size.width * 0.1),
                    Row(
                      children: [
                        Text('나이',
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
                    IconButton(
                        onPressed: () {
                          check = '나이';
                          modify(context);
                        },
                        icon: Icon(Icons.edit))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: size.width * 0.1),
                    Row(
                      children: [
                        Text('신장',
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
                    IconButton(
                        onPressed: () {
                          check = '신장';
                          modify(context);
                        },
                        icon: Icon(Icons.edit))
                  ],
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
                    IconButton(
                        onPressed: () {
                          check = '몸무게';
                          modify(context);
                        },
                        icon: Icon(Icons.edit))
                  ],
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
                    // IconButton(
                    //     onPressed: () {
                    //       check = '활동량';
                    //       modify(context);
                    //     },
                    //     icon: Icon(Icons.edit))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
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
                          width: size.width * 0.2,
                        ),
                        Text('${widget.userdata[5]} Kcal'),
                      ],
                    ),
                  ],
                ),
                Text('${widget.userdata}'),
                SizedBox(height: size.height * 0.05),
                TextButton(
                    onPressed: () {
                      OtherDate(context);
                      // print(userage);
                      // print(userheight);
                      // print(userweight);
                      // print(useract);
                      // print(usercal);
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

  Future<void> modify(BuildContext context) {
    if (check == '나이') {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                '개인정보 기입',
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          controller: _agecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '나이를 입력해주세요';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                userage = int.parse(_agecontroller.text);
                              });
                              _agecontroller.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('수정'))
                    ],
                  ),
                ),
              ),
            );
          });
    } else if (check == '신장') {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                '개인정보 기입',
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
                              label: Text('신장',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          controller: _heightcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '신장을 입력해주세요';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              widget.userdata[2] =
                                  double.parse(_heightcontroller.text);
                              _heightcontroller.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('수정'))
                    ],
                  ),
                ),
              ),
            );
          });
    } else if (check == '몸무게') {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                '개인정보 기입',
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
                              label: Text('몸무게',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
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
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              widget.userdata[3] =
                                  double.parse(_weightcontroller.text);
                              _weightcontroller.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('수정'))
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                '개인정보 기입',
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
                              label: Text('활동량',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          controller: _weightcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '활동량을 선택해주세요';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              widget.userdata[4] = _actcontroller.text;
                              _actcontroller.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('수정'))
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  Future<void> OtherDate(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '개인정보 기입',
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
                        controller: _agecontroller,
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
                        controller: _agecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '몸무게를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            // _agecontroller.clear();
                            // period = int.parse(_agecontroller.text);
                            // sendFoodData();
                            // Navigator.of(context).pop();
                            // print(period);
                            // _navigatetolist();
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
}
