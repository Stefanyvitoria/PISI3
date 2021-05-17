import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animecom/login_page/view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animecom/pre-sets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1200);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: LoginPage(),
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 800)));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                darkpurple,
                darkpurple,
              ]),
          //color: Color(0xFF5464b7),
          image: DecorationImage(image: AssetImage('assets/ANIMECOM.png'))),
    );
  }
}
