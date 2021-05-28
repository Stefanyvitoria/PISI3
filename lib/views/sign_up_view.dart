import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_view.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      child: Scaffold(
        body: Container(
          color: darkpurple,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ANIMECOM.png'),
                          fit: BoxFit.cover),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 25, right: 25),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              fillColor: purplenavy,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 20)),
                              labelText: 'Email',
                              labelStyle: quicksand(
                                  color: linen,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal)),
                          style: quicksand(
                              color: linen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 25, right: 25),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: purplenavy,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              prefixIcon: Icon(Icons.vpn_key),
                              labelText: 'Password',
                              labelStyle: quicksand(
                                  color: linen,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal)),
                          style: quicksand(
                              color: linen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 25, right: 25),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: purplenavy,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              prefixIcon: Icon(Icons.vpn_key),
                              labelText: 'Confirm Password',
                              labelStyle: quicksand(
                                  color: linen,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal)),
                          style: quicksand(
                              color: linen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 25, right: 25),
                        child: TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(MediaQuery.of(context).size.width, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0XFFDAE2E7),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Signup',
                            style: quicksand(
                                color: darkpurple,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: darkpurple,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                ),
                Container(
                  height: height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: quicksand(
                            color: linen,
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: LoginPage(),
                                  type: PageTransitionType.leftToRightWithFade,
                                  duration: Duration(milliseconds: 800)));
                        },
                        child: Text(
                          'Sign In',
                          style: quicksand(
                              color: linen,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
