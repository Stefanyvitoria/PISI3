import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  int _selectedIndex = 0;
  static List _titleOptions = ['Home', 'Profile', 'Search'];
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 50, right: 50),
            child: Container(
              child: Center(
                child: Text(
                  'Top Rated',
                  style: quicksand(
                      color: linen,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
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
              padding: EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Container(
                child: Center(
                  child: Text(
                    'Shonen',
                    style: quicksand(
                        color: linen,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                height: 160,
                width: 50,
                decoration: BoxDecoration(
                    color: darkpurple,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              )),
          Padding(
              padding: EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Container(
                child: Center(
                  child: Text(
                    'Comedy',
                    style: quicksand(
                        color: linen,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                height: 160,
                width: 50,
                decoration: BoxDecoration(
                    color: darkpurple,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              )),
          Padding(
              padding: EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Container(
                child: Center(
                  child: Text(
                    'Isekai',
                    style: quicksand(
                        color: linen,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                height: 160,
                width: 50,
                decoration: BoxDecoration(
                    color: darkpurple,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              )),
          Padding(
              padding: EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Container(
                child: Center(
                  child: Text(
                    'Shoujo',
                    style: quicksand(
                        color: linen,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
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
    ),
    Container(
      child: Center(
        child: Text(
          'Profile',
          style: quicksand(
              color: linen, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      color: darkpurple,
    ),
    Container(
      child: Center(
        child: Text(
          'Search',
          style: quicksand(
              color: linen, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      color: darkpurple,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              _titleOptions.elementAt(_selectedIndex),
              style: quicksand(
                  color: darkpurple,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          unselectedFontSize: 12,
          selectedFontSize: 14,
          selectedIconTheme: IconThemeData(size: 40),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: slateblue,
          onTap: _onItemTapped,
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}
