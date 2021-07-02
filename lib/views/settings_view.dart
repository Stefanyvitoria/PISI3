import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/catalog_view.dart';
import 'package:animecom/views/edit_view.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/widgets_constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UserController userController;
  String _password;

  @override
  void initState() {
    userController = new UserController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Profile user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            Icons.close,
          ),
          onTap: () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(right: 55.0),
          child: Center(
            child: Text(
              'Settings',
              style: quicksand(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkblue4),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [darkblue1, darkblue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'General',
                style: quicksand(
                    color: gainsboro,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                color: gainsboro,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.language,
                        color: darkblue4,
                        size: 25,
                      ),
                      title: Text(
                        'Language',
                        style: quicksand(
                            color: darkblue4,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      height: 10.0,
                      color: darkblue4,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.memory,
                        color: darkblue4,
                        size: 25,
                      ),
                      title: Text('Memory usage',
                          style: quicksand(
                              color: darkblue4,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Divider(
                      height: 10.0,
                      color: darkblue4,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.info,
                        color: darkblue4,
                        size: 25,
                      ),
                      title: Text(
                        'About',
                        style: quicksand(
                            color: darkblue4,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Preferences',
                style: quicksand(
                    color: gainsboro,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                  color: gainsboro,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.brightness_6,
                          color: darkblue4,
                          size: 25,
                        ),
                        title: Text(
                          'Dark/Light mode',
                          style: quicksand(
                              color: darkblue4,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: darkblue4,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.notifications,
                          color: darkblue4,
                          size: 25,
                        ),
                        title: Text('Notifications',
                            style: quicksand(
                                color: darkblue4,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Account',
                style: quicksand(
                    color: gainsboro,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Card(
                  color: gainsboro,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile())),
                        leading: Icon(
                          Icons.manage_accounts_rounded,
                          color: darkblue4,
                          size: 25,
                        ),
                        title: Text(
                          'Profile',
                          style: quicksand(
                              color: darkblue4,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: darkblue4,
                      ),
                      ListTile(
                        onTap: () {
                          WidgetsConstantes.alert(
                            context: context,
                            content: Text('Delete Account?'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'No',
                                    style: quicksand(
                                      fontWeight: FontWeight.bold,
                                      color: darkblue4,
                                    ),
                                  )),
                              TextButton(
                                onPressed: () {
                                  //userController.prefClear();
                                  //userController.deleteUser(
                                  //    user.getEmail, user.getPassword);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        child: Catalog(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration: Duration(milliseconds: 800),
                                        settings:
                                            RouteSettings(name: 'catalog'),
                                      ),
                                      (route) => false);
                                },
                                child: Text(
                                  'Yes',
                                  style: quicksand(
                                    fontWeight: FontWeight.bold,
                                    color: darkblue4,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        leading: Icon(
                          Icons.delete,
                          color: darkblue4,
                          size: 25,
                        ),
                        title: Text(
                          'Delete Account',
                          style: quicksand(
                              color: darkblue4,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: darkblue4,
                      ),
                      ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 5,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 20,
                                          bottom: 10,
                                        ),
                                        child: TextFormField(
                                          obscureText: true,
                                          onChanged: (value) =>
                                              _password = value,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.vpn_key_rounded),
                                              fillColor: darkblue3,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: BorderSide(
                                                      color: Colors.green,
                                                      width: 20)),
                                              labelText: 'Password',
                                              labelStyle: quicksand(
                                                  color: gainsboro,
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          style: quicksand(
                                              color: gainsboro,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          //user.setPassword = _password;
                                          //userController.updateUser(user);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Update',
                                          style: TextStyle(color: darkblue4),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        leading: Icon(
                          Icons.vpn_key_rounded,
                          color: darkblue4,
                          size: 25,
                        ),
                        title: Text(
                          'Password',
                          style: quicksand(
                              color: darkblue4,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
