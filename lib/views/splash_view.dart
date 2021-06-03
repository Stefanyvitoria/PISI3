import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animecom/views/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animecom/views/pre-sets.dart';

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
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                darkpurple,
                darkpurple,
              ]),
          image: DecorationImage(image: AssetImage('assets/ANIMECOM.png'))),
    );
  }
}
