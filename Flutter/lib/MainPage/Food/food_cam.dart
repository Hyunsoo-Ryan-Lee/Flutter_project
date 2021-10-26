import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart' as rootBundle;

class FoodCamera extends StatefulWidget {
  @override
  _FoodCameraState createState() => _FoodCameraState();
}

class _FoodCameraState extends State<FoodCamera> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _picker = ImagePicker();
  File _image;
  String message = '';
  // String address = 'https://d8be-112-154-191-206.ngrok.io/foodselect';
  String address = 'http://c679-119-192-202-235.ngrok.io/repository/predict';
  String diet_address =
      'http://c679-119-192-202-235.ngrok.io/repository/dietsave';
  Dio dio = new Dio();
  bool _canShowButton = true;
  final _valuelist = [
    '아침',
    '점심',
    '저녁',
  ];
  String dropdownValue = '아침';
  String holder = '';

  String uuid = '';
  void GetUserId() {
    final User user = auth.currentUser;
    uuid = user.email;
  }

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  getFoodInfo() async {
    try {
      var response = await Dio().get(address);
      print(response);
    } catch (e) {
      print(e);
    }
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
      uploadImage();
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
        uploadImage();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var rawstring = '';
  var cutstring = '';
  var array = '';
  var fid = '';
  var fname = '';
  int famount;
  double fcal;
  double fcarboh;
  double fprotein;
  double ffat;
  uploadImage() async {
    final request = http.MultipartRequest('POST', Uri.parse(address));
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    request.files.add(http.MultipartFile(
        'image', _image.readAsBytes().asStream(), _image.lengthSync(),
        filename: _image.path.split('/').last));
    request.headers.addAll(headers);

    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    if (response.statusCode == 200) {
      fid = resJson['fid'];
      fname = resJson['fname'];
      famount = resJson['famount'];
      fcal = resJson['fcal'];
      fcarboh = resJson['fcarboh'];
      fprotein = resJson['fprotein'];
      ffat = resJson['ffat'];
    }
    setState(() {});
  }

  Widget _imageView() {
    if (_image == null) {
      return Text('No Image Selected!');
    } else {
      return Image.file(
        _image,
        width: 400,
        height: 400,
      );
    }
  }
  // Future<void> readJson() async {
  //   // var responseJson = await Dio().get(address);
  //   // final String response =
  //   //     await rootBundle.rootBundle.loadString('assets/json/mJson.json');
  //   // final data = await json.decode(response);
  //   setState(() {
  //     // _items = data['items'];
  //     _items = [resJson];
  //   });
  // }

  Widget _foodTable() {
    if (_image == null) {
      return Text('');
    } else {
      return DataTable2(
          columnSpacing: 1,
          horizontalMargin: 12,
          columns: [
            DataColumn2(
              label: Text(
                '음식명',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text(
                '섭취량',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text(
                '칼로리',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text(
                '탄수화물',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text(
                '단백질',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text(
                '지방',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            ),
          ],
          rows: List<DataRow>.generate(
              //  _items.length,
              1,
              (index) => DataRow(cells: [
                    DataCell(Text("$fname")),
                    DataCell(Text("$famount")),
                    DataCell(Text("$fcal")),
                    DataCell(Text("$fcarboh")),
                    DataCell(Text("$fprotein")),
                    DataCell(Text("$ffat")),
                  ])));
    }
  }

  Widget _DayTime() {
    if (_image == null) {
      return Text('');
    } else {
      return DropdownButton(
        value: dropdownValue,
        onChanged: (String newValue) {
          getDropDownItem();
          setState(() {
            dropdownValue = newValue;
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
  }

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              '식단 사진',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.blueAccent[100],
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _imageView(),
                    _foodTable(),
                    SizedBox(
                      height: 3,
                    ),
                    _DayTime(),
                    SizedBox(
                      height: 10,
                    ),
                    !_canShowButton
                        ? const SizedBox.shrink()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 20)),
                            onPressed: () {
                              _showDialog(context);
                              hideWidget();
                              GetUserId();
                            },
                            child: Text('Select Image')),
                    _canShowButton
                        ? const SizedBox.shrink()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 20)),
                            onPressed: () {
                              sendFoodData([
                                uuid,
                                fid,
                                dropdownValue,
                                fname,
                                famount,
                                fcal,
                                fcarboh,
                                fprotein,
                                ffat
                              ]);
                              final snackBar = SnackBar(
                                content: const Text("영양소 정보 저장이 완료되었습니다."),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              Navigator.of(context).pop();
                            },
                            child: Text('Save')),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<http.Response> sendFoodData(List diet) {
    return http.post(
      Uri.parse(diet_address),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uuid': diet[0],
        'fid': diet[1],
        'meal': diet[2],
        'fname': diet[3],
        'amount': diet[4],
        'cal': diet[5],
        'carboh': diet[6],
        'protein': diet[7],
        'fat': diet[8]
      }),
    );
  }
}
