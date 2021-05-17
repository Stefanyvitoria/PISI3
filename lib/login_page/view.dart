import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkpurple,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ANIMECOM.png'),
                        fit: BoxFit.cover),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
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
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          onPressed: () {},
                          child: Text(
                            'LOGIN',
                            style: quicksand(
                                color: darkpurple,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Color(0XFFDAE2E7),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: darkpurple,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                )),
            Padding(
              padding: EdgeInsets.only(top: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
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
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: quicksand(
                            color: linen,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
