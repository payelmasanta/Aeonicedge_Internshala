import 'dart:async';
import 'package:Aeonicedge/main.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff89d0f0),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image(image: AssetImage("assets/splash.gif")),
          ),
        ],
      ),
    );
  }
}
