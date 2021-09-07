import 'package:camera_live_feed/VideoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'ImagesScreen.dart';

List<CameraDescription> cameras;

class MainScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('images/dogbg.png'), fit: BoxFit.fill),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      'DOG BREED SCANNER',
                      style: TextStyle(
                          color: Colors.orange.shade700, fontSize: 30),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoScreen()));
                      },
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            color: Colors.white,
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.videocam_rounded,
                                    size: 50,
                                    color: Colors.orange.shade700,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            'Video',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImagesScreen()));
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.orange.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          'Images',
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
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage('images/dogbg.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
