import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/user_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'catalog_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _email, _password;
  UserController userController;
  @override
  void initState() {
    userController = new UserController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    String _validarEmail(String value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (value.length == 0) {
        return "Enter the Email";
      } else if (!regExp.hasMatch(value)) {
        return "Invalid email";
      } else {
        return null;
      }
    }

    String _validarSenha(String value) {
      if (value.length == 0) {
        return "enter the password";
      } else if (value.length < 8) {
        return "Password must contain at least 8 characters";
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
            child: ListView(
              children: <Widget>[
                Container(
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ANIMECOM.png'),
                          fit: BoxFit.cover),
                    )),
                Container(
                  height: height * 0.6,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height * 0.6 * 0.2,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          onChanged: (value) => _email = value,
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
                                  fontWeight: FontWeight.normal)),
                          style: quicksand(
                              color: linen,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        height: height * 0.6 * 0.2,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          onChanged: (value) => _password = value,
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
                      Container(
                        constraints: BoxConstraints(maxHeight: 50),
                        height: height * 0.6 * 0.15,
                        padding: const EdgeInsets.only(left: 25, right: 25),
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
                          onPressed: () async {
                            //Verifica se o usuário está no banco.
                            //Falta verificar a senha.
                            User user = await userController.getUser(_email);
                            if (_sendForm() && (user != null)) {
                              userController.prefSetUser(_email);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    child: Catalog(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 800),
                                    settings: RouteSettings(arguments: user),
                                  ),
                                  (route) => false);
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
                      Container(
                        alignment: Alignment.topCenter,
                        height: height * 0.6 * 0.2,
                        child: TextButton(
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
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: Row(
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
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              child: SignupPage(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(milliseconds: 800),
                            ),
                            (route) {
                              if (route.settings.name == 'catalog' ||
                                  route.settings.name == 'signin' ||
                                  route.settings.name == 'signup') return true;
                              return false;
                            },
                          );
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
