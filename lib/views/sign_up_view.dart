import 'package:animecom/controllers/profile_controller.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_view.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  UserController userController;
  String email, password1, password2;

  @override
  void initState() {
    userController = UserController();
    super.initState();
  }

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
      if (password1 != password2) return false;
      // Sem erros na validação
      _key.currentState.save();
      return true;
    } else {
      // erro de validação
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        height: height,
        child: Scaffold(
          body: Container(
            color: darkblue,
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
                        height: height * 0.6 * 0.15,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: AnimeTextField(
                          type: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          text: 'Email',
                          icon: Icon(Icons.email),
                          obscureText: false,
                          labelsize: 16.0,
                          inputtextsize: 16.0,
                          validator: _validarEmail,
                        ),
                      ),
                      Container(
                        height: height * 0.6 * 0.15,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: AnimeTextField(
                          type: TextInputType.emailAddress,
                          onChanged: (value) => password1 = value,
                          text: 'Password',
                          icon: Icon(Icons.vpn_key),
                          obscureText: true,
                          labelsize: 16.0,
                          inputtextsize: 16.0,
                          validator: _validarSenha,
                        ),
                      ),
                      Container(
                        height: height * 0.6 * 0.18,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: AnimeTextField(
                          type: TextInputType.emailAddress,
                          onChanged: (value) => password2 = value,
                          text: 'Confirm password',
                          icon: Icon(Icons.vpn_key),
                          obscureText: true,
                          labelsize: 16.0,
                          inputtextsize: 16.0,
                          validator: _validarSenha,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: 50),
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                MediaQuery.of(context).size.width,
                                height * 0.6 * 0.15)),
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
                            if (_sendForm()) {
                              await userController.setUser(email, password1);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    child: LoginPage(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 800),
                                  ), (route) {
                                if (route.settings.name == 'catalog')
                                  return true;
                                return false;
                              });
                            }
                          },
                          child: Text(
                            'Signup',
                            style: quicksand(
                                color: darkpurple,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
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
                        "Already have an account?",
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
                              child: LoginPage(),
                              type: PageTransitionType.leftToRightWithFade,
                              duration: Duration(milliseconds: 800),
                            ),
                            (route) {
                              if (route.settings.name == 'catalog' ||
                                  route.settings.name == 'signup' ||
                                  route.settings.name == 'signin') return true;
                              return false;
                            },
                          );
                        },
                        child: Text(
                          'Sign In',
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
