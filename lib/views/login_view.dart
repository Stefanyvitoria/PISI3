import 'package:animecom/pre-sets.dart';
import 'package:animecom/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'catalog_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    String _validarEmail(String value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (value.length == 0) {
        return "Informe o Email";
      } else if (!regExp.hasMatch(value)) {
        return "Email inválido";
      } else {
        return null;
      }
    }

    String _validarSenha(String value) {
      if (value.length == 0) {
        return "Informe a Senha";
      } else if (value.length < 8) {
        return "A senha deve conter no Minimo 8 caracteres";
      } else {
        return null;
      }
    }

    _sendForm() {
      if (_key.currentState.validate()) {
        // Sem erros na validação
        _key.currentState.save();
        return true;
      } else {
        // erro de validação
        return false;
      }
    }

    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
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
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 25),
                          child: TextFormField(
                            validator: _validarEmail,
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
                                    fontWeight: FontWeight.normal
                                )
                            ),
                            style: quicksand(
                                color: linen,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 25),
                          child: TextFormField(
                            validator: _validarSenha,
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
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 25),
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
                            onPressed: () {
                              if (_sendForm()) {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Catalog(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration: Duration(milliseconds: 800)));
                              }
                            },
                            child: Text(
                              'Login',
                              style: quicksand(
                                  color: darkpurple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Forgot your password?',
                            style: quicksand(
                                color: linen,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: quicksand(
                                  color: linen,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: SignupPage(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration: Duration(milliseconds: 800)));
                              },
                              child: Text(
                                'Sign Up',
                                style: quicksand(
                                    color: linen,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
