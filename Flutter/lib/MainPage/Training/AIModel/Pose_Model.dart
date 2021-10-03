import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_auth/MainPage/Food/food_cam.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/AI_Camera.dart';
import 'package:flutter_auth/MainPage/Training/AIModel/armPress.dart';
import 'package:tflite/tflite.dart';

class Pose_armpress extends StatefulWidget {
  final String title;
  final List<CameraDescription> cameras;
  const Pose_armpress({this.cameras, this.title});

  @override
  _Pose_armpressState createState() => _Pose_armpressState();
}

class _Pose_armpressState extends State<Pose_armpress> {
  List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 0;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Arm Press'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          AI_Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderDataArmPress(
            data: _data == null ? [] : _data,
            previewH: max(_imageHeight, _imageWidth),
            previewW: min(_imageHeight, _imageWidth),
            screenH: screen.height,
            screenW: screen.width,
          ),
        ],
      ),
    );
  }
}
