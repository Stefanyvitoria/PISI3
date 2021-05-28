import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';
import 'package:animecom/views/post_login_screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  int _selectedIndex = 0;
  static List _titleOptions = ['Home', 'Profile', 'Search'];
  static List<Widget> _widgetOptions = <Widget>[catalog, profile, search];

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
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 400),
          animationCurve: Curves.fastOutSlowIn,
          height: 50,
          backgroundColor: darkpurple,
          onTap: (index) {
            _onItemTapped(index);
          },
          items: <Widget>[
            Icon(Icons.home),
            Icon(Icons.person),
            Icon(Icons.search),
          ],
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

// BottomNavigationBar(
//           iconSize: 35,
//           unselectedFontSize: 12,
//           selectedFontSize: 14,
//           selectedIconTheme: IconThemeData(size: 40),
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home,
//                 ),
//                 label: 'Home',
//                 backgroundColor: Colors.red),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//                 backgroundColor: Colors.green),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: slateblue,
//           onTap: _onItemTapped,
//         ),
