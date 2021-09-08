import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagesScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImagesScreen> {
  File _image;
  ImagePicker imagePicker;
  String result = 'DOG BREED SCANNER';
  @override
  void initState() {
    imagePicker = ImagePicker();
    loadModelFiles();
  }

  Future<void> imageFromGallery() async {
    PickedFile file = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(file.path);
      if (_image != null) {
        startImageRecognition();
      }
    });
  }

  Future<void> imageFromCamera() async {
    PickedFile file = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(file.path);
      if (_image != null) {
        startImageRecognition();
      }
    });
  }

  //TODO load model files
  loadModelFiles() async {
  }

  //TODO perform image recognition with images
  startImageRecognition() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Image.file(),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      '$result',
                      style: TextStyle(
                          color: Colors.orange.shade700, fontSize: 30),
                    ))),

            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: _image != null
                    ? Container(
                        child: Image.file(
                          _image,
                          width: 300,
                          height: 300,
                        ),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                      )
                    : Image.asset(
                        'images/dogbg.png',
                        width: 300,
                        height: 300,
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    imageFromGallery();
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        color: Colors.white,
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  child: Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.orange.shade700,
                              )),
                            ],
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'urdu_font',
                          color: Colors.orange.shade700,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          imageFromCamera();
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  child: Icon(
                                Icons.camera,
                                size: 50,
                                color: Colors.orange.shade700,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'urdu_font',
                        color: Colors.orange.shade700,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
