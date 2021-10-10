import 'dart:convert';
import 'dart:io';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
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
  final _picker = ImagePicker();
  File _image;
  String message = '';
  String address = 'https://24f8-112-154-191-206.ngrok.io/foodselect';
  Dio dio = new Dio();
  bool _canShowButton = true;

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
      // Response response = await dio.post(address,
      //     data: formdata,
      //     options: Options(headers: {
      //       'accept': '*/*',
      //       'Authorization': 'Bearer accesstoken',
      //       'Content Type': 'multipart/form.data'
      //     }));
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
        // getFoodInfo();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var rawstring = '';
  var cutstring = '';
  var array = '';
  var fname = '';
  var famount = '';
  var fcal = '';
  var fcarboh = '';
  var fprotein = '';
  var ffat = '';
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
                    // DataCell(Text(_items[index]["FNAME"])),
                    // DataCell(Text(_items[index]["CAL"])),
                    // DataCell(Text(_items[index]["CARBOH"])),
                    // DataCell(Text(_items[index]["PROTEIN"])),
                    // DataCell(Text(_items[index]["FAT"])),
                    // DataCell(Text(_items[index]["AMOUNT"])),
                  ])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  !_canShowButton
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(150, 20)),
                          onPressed: () {
                            _showDialog(context);
                            hideWidget();
                          },
                          child: Text('Select Image')),
                  _canShowButton
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(150, 20)),
                          onPressed: () {
                            getFoodInfo();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => ReportChart()));
                          },
                          child: Text('Send')),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       getHttp();
                  //     },
                  //     child: Text('ㄱㄱ')),
                ],
              ),
            ),
          ),
        ));
  }
}
