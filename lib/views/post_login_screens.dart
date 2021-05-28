import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';

var catalog = Container(
  decoration: BoxDecoration(color: Colors.white),
  child: ListView(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Container(
          child: Center(
            child: Text(
              'Top Rated',
              style: quicksand(
                  color: linen, fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          height: 160,
          width: 50,
          decoration: BoxDecoration(
              color: darkpurple,
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 25, left: 30, right: 30),
          child: Container(
            child: Center(
              child: Text(
                'Shonen',
                style: quicksand(
                    color: linen, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            height: 160,
            width: 50,
            decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.all(Radius.circular(25))),
          )),
      Padding(
          padding: EdgeInsets.only(top: 25, left: 30, right: 30),
          child: Container(
            child: Center(
              child: Text(
                'Comedy',
                style: quicksand(
                    color: linen, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            height: 160,
            width: 50,
            decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.all(Radius.circular(25))),
          )),
      Padding(
          padding: EdgeInsets.only(top: 25, left: 30, right: 30),
          child: Container(
            child: Center(
              child: Text(
                'Isekai',
                style: quicksand(
                    color: linen, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            height: 160,
            width: 50,
            decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.all(Radius.circular(25))),
          )),
      Padding(
          padding: EdgeInsets.only(top: 25, left: 30, right: 30),
          child: Container(
            child: Center(
              child: Text(
                'Shoujo',
                style: quicksand(
                    color: linen, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            height: 160,
            width: 50,
            decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ))
    ],
  ),
);

var profile = Container(
  decoration: BoxDecoration(color: darkpurple),
  child: ListView(
    children: <Widget>[
      Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 80, bottom: 20),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 70,
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'Profile',
                  style: quicksand(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: linen),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: darkpurple),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
            child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.star,
                color: darkpurple,
                size: 25,
              ),
              title: Text(
                'Favorites',
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
              leading: Icon(
                Icons.settings,
                color: darkpurple,
                size: 25,
              ),
              title: Text('Settings',
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
                Icons.logout,
                color: darkpurple,
                size: 25,
              ),
              title: Text('Logout',
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
);

var search = Container(
  decoration: BoxDecoration(color: darkpurple),
  child: Column(
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: purplenavy,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.green, width: 20)),
                labelText: 'Type here',
                labelStyle: quicksand(
                    color: linen,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal)),
            style: quicksand(
                color: linen, fontSize: 16.0, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0XFFDAE2E7)),
              fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Search',
              style: quicksand(
                  fontSize: 20.0,
                  color: darkpurple,
                  fontWeight: FontWeight.bold),
            )),
      )
    ],
  ),
);
