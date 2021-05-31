import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
    );
  }
}
