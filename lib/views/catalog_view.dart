import 'package:animecom/models/user_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/favorites_view.dart';
import 'package:animecom/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List genders = [
    'Top Rated',
    'Favorites',
    'Shounen',
    'Shoujo',
    'Comedy',
    'Sobrenatural',
    'Yuri',
    'Yaoi',
    'Hentai',
    'Ecchi',
    'Adventure',
    'Action'
  ];

  PageController _pageController;
  int _selectedIndex = 0;
  static List _titleOptions = ['Home', 'Profile', 'Search'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context).settings.arguments;
    User user = arg != null ? arg : User();
    double width = MediaQuery.of(context).size.width;

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
          animationDuration: Duration(milliseconds: 500),
          animationCurve: Curves.ease,
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
        body: SizedBox.expand(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: [
              Container(
                decoration: BoxDecoration(color: darkpurple),
                child: ListView(
                  children: <Widget>[
                    for (String item in genders)
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 30, right: 30, bottom: 10),
                        child: Container(
                          child: Center(
                            child: Text(
                              item,
                              style: quicksand(
                                  color: darkpurple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          height: 160,
                          width: 50,
                          decoration: BoxDecoration(
                              color: gainsboro,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: darkpurple),
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 80, bottom: 20),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profile.jpg'),
                                radius: 70,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: Text(
                                user.name == null ? 'Profile' : user.name,
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Favorites()));
                            },
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage(),
                                    settings: RouteSettings(arguments: user)),
                              );
                            },
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
              ),
              Container(
                decoration: BoxDecoration(color: darkpurple),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 25, right: 25),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              fillColor: purplenavy,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 20)),
                              labelText: 'Type here',
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFDAE2E7)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(width / 4, 50)),
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
              )
            ],
          ),
        ));
  }
}
