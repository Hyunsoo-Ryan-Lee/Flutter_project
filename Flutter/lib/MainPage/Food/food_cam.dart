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
import 'package:data_table_2/data_table_2.dart';
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
  String address = 'https://5ef5-112-154-191-206.ngrok.io/foodselect';
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

      // readCounter();
      // writeCounter(response);
      // File file = new File('assets/json/mmJson.json');
      // file.createSync();
      // file.writeAsStringSync(json.encode(response));
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(var counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }

  uploadImage() async {
    final request = http.MultipartRequest('POST', Uri.parse(address));
    final headers = {
      'Content-type': 'multipart/form-data',
      "Accept": 'multipart/form-data'
    };
    request.files.add(http.MultipartFile(
        'image', _image.readAsBytes().asStream(), _image.lengthSync(),
        filename: _image.path.split('/').last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson;
    print(res);
    setState(() {});
  }

  Future _openGallary(BuildContext context) async {
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 5);
    if (image != null) {
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
      Navigator.of(context).pop();
      uploadImage();
      getFoodInfo();
    }
    try {
      String filename = image.path.split('/').last;
      FormData formdata = new FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType('image', 'png')),
        'type': 'image/png'
      });
      Response response = await dio.post(address,
          data: formdata,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer accesstoken',
            'Content Type': 'multipart/form.data'
          }));
      print(response);
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
        getFoodInfo();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
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

  List _items = [];
  Future<void> readJson() async {
    var responseJson = await Dio().get(address);

    // final String response =
    //     await rootBundle.rootBundle.loadString('assets/json/mJson.json');
    // final data = await json.decode(response);
    setState(() {
      // _items = data['items'];
      _items = [responseJson];
    });
  }

  Widget _foodTable() {
    readJson();
    if (_image == null) {
      return Text('');
    } else {
      var iii = _items[0].toString();
      var array = iii.split(",");
      var fname = array[0].substring(1);
      var famount = array[1];
      var fcal = array[2];
      var fcarboh = array[3];
      var fprotein = array[4];
      var ffat = array[5].substring(0, 1);
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
