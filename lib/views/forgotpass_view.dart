import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/sign_up_view.dart';
import 'package:animecom/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'catalog_view.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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
                          height: height * 0.6 * 0.2,
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: AnimeTextField(
                            type: TextInputType.emailAddress,
                            onChanged: (value) => _email = value,
                            text: 'Email',
                            icon: Icon(Icons.email),
                            obscureText: false,
                            labelsize: 16.0,
                            inputtextsize: 16.0,
                            validator: _validarEmail,
                          )),
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
                            Profile user = await userController.getUser(_email);
                            if (_sendForm() &&
                                (user != null) &&
                                (user.getPassword == _password)) {
                              appController.prefSetUser(user.getEmail);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    child: Catalog(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 800),
                                    settings: RouteSettings(
                                        name: 'catalog', arguments: user),
                                  ),
                                  (route) => false);
                            }
                          },
                          child: Text(
                            'Send email',
                            style: quicksand(
                                color: darkpurple,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 50),
                          height: height * 0.6 * 0.15,
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(MediaQuery.of(context).size.width, 50)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red[400],
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: quicksand(
                                  color: darkpurple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
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
