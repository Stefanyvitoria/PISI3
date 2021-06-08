import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/user_model.dart';
import 'package:animecom/views/catalog_view.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UserController userController;

  @override
  void initState() {
    userController = new UserController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            Icons.close,
          ),
          onTap: () {
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
                  color: darkpurple),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(color: darkpurple),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'General',
                style: quicksand(
                    color: linen, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text(
                      'Language',
                      style: quicksand(
                          color: darkpurple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                    color: darkpurple,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.memory,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text('Memory usage',
                        style: quicksand(
                            color: darkpurple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Divider(
                    height: 10.0,
                    color: darkpurple,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.more_horiz,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text('More',
                        style: quicksand(
                            color: darkpurple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Preferences',
                style: quicksand(
                    color: linen, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.brightness_6,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text(
                      'Dark/Light mode',
                      style: quicksand(
                          color: darkpurple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                    color: darkpurple,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.notifications,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text('Notifications',
                        style: quicksand(
                            color: darkpurple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Profile',
                style: quicksand(
                    color: linen, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.manage_accounts_rounded,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text(
                      'Account',
                      style: quicksand(
                          color: darkpurple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                    color: darkpurple,
                  ),
                  ListTile(
                    onTap: () {
                      userController.deleteUser(user.email, user.password);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            child: Catalog(),
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: Duration(milliseconds: 800),
                          ),
                          (route) => false);
                    },
                    leading: Icon(
                      Icons.delete,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text(
                      'Delete Account',
                      style: quicksand(
                          color: darkpurple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                    color: darkpurple,
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.3,
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
                                      onChanged: (value) =>
                                          user.password = value,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.password),
                                          fillColor: purplenavy,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 20)),
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
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        userController.updateUser(user);
                                      },
                                      child: Text(
                                        'Update',
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ),
                            );
                          });
                    },
                    leading: Icon(
                      Icons.password_rounded,
                      color: darkpurple,
                      size: 25,
                    ),
                    title: Text(
                      'Password',
                      style: quicksand(
                          color: darkpurple,
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
