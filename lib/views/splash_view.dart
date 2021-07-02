import 'dart:async';
import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/user_model.dart';
import 'package:animecom/views/catalog_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animecom/views/pre-sets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController userController;
  @override
  void initState() {
    userController = UserController();
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1200);
    return new Timer(duration, route);
  }

  route() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: Catalog(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: Duration(milliseconds: 800),
        settings: RouteSettings(
          name: 'catalog',
          arguments: await userController.loadUser(),
        ),
      ),
    );
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
