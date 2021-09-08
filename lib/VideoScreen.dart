import 'package:camera_live_feed/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VideoScreen> {
  List<CameraDescription> cameras;
  CameraImage img;
  CameraController controller;
  bool isBusy = false;
  String result = "";
  String imgName = "dogbg.png";

  @override
  void initState() {
    super.initState();
    loadModel();
    iniCamera();
  }

  //TODO intialize camera controller and get frames of live camera footage one by one
  iniCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        controller.startImageStream((image) => {
              if (!isBusy) {isBusy = true, img = image, startImageRecognition()}
            });
      });
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller?.dispose();
  }

  //TODO load model and label file
  loadModel() async {}

  //TODO perform image classification with loaded model
  startImageRecognition() async {
    isBusy = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                          child: controller == null
                              ? Center(
                                  child: Container(
                                    width: 140,
                                    height: 150,
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: CameraPreview(controller),
                                ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 130),
                          child: Image.asset('images/rec.png')),
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                'DOG BREED SCANNER',
                                style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontSize: 25),
                              ))),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      margin: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 25, right: 25, bottom: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35.0),
                                    child: Container(
                                        color: Colors.black,
                                        child: Image.asset('images/$imgName'))),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(top: 8, left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '$result',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
