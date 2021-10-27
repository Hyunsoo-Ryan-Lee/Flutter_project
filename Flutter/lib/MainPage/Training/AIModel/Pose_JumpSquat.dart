// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter_auth/MainPage/Training/AIModel/AI_Camera.dart';
// import 'package:flutter_auth/MainPage/Training/AIModel/Render_jumpsquat.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:math';

// class Pose_JumpSquat extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   final String title;
//   const Pose_JumpSquat({this.cameras, this.title});
//   @override
//   _Pose_JumpSquatState createState() => _Pose_JumpSquatState();
// }

// class _Pose_JumpSquatState extends State<Pose_JumpSquat> {
//   List<dynamic> _data;
//   int _imageHeight = 0;
//   int _imageWidth = 0;
//   int x = 1;

//   @override
//   void initState() {
//     super.initState();
//     var res = loadModel();
//     print('Model Response: ' + res.toString());
//   }

//   _setRecognitions(data, imageHeight, imageWidth) {
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _data = data;
//       _imageHeight = imageHeight;
//       _imageWidth = imageWidth;
//     });
//   }

//   loadModel() async {
//     return await Tflite.loadModel(
//         model: "assets/json/posenet_mv1_075_float_from_checkpoints.tflite");
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screen = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AlignAI Jumpsqurt'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: <Widget>[
//           AI_Camera(
//             cameras: widget.cameras,
//             setRecognitions: _setRecognitions,
//           ),
//           RenderDataJumpsquat(
//             data: _data == null ? [] : _data,
//             previewH: max(_imageHeight, _imageWidth),
//             previewW: min(_imageHeight, _imageWidth),
//             screenH: screen.height,
//             screenW: screen.width,
//           ),
//         ],
//       ),
//     );
//   }
// }
