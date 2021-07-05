import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/controllers/favorites_controller.dart';
import 'package:animecom/controllers/profile_controller.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/login_view.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/favorites_view.dart';
import 'package:animecom/views/settings_view.dart';
import 'package:animecom/views/sign_up_view.dart';
import 'package:animecom/views/widgets/anime_container.dart';
import 'package:animecom/views/widgets/category_container.dart';
import 'package:animecom/views/widgets/widgets_constantes.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:async/async.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  AnimeController animeController = AnimeController();
  PageController _pageController;
  UserController userController;
  FavoriteController favoriteController;
  String _text;
  Profile user;
  List titles = ['Catalog', 'Profile', 'Search'];
  String title = 'Catalog';
  var _sportsFuture,
      _shounenFuture,
      _actionFuture,
      _topRatedFuture,
      _searchFuture;
  @override
  void initState() {
    favoriteController = FavoriteController();
    userController = UserController();
    super.initState();
    _pageController = PageController();
    _topRatedFuture = animeListScore(8);

    _sportsFuture = animeList('Sports');

    _shounenFuture = animeList('Shounen');
    _actionFuture = animeList('Action');

    _searchFuture = animeListCluster('pokemon');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {});
    title = titles[index];
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  animeList(genre) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List animeList = await animeController.getAnimebyGenre(genre);

      return animeList;
    } catch (e) {}
  }

  animeListScore(score) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List animeList = await animeController.getAnimebyScore(score);

      return animeList;
    } catch (e) {}
  }

  animeListCluster(text) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List animeList = await animeController.getClusterization(text);
      return animeList;
    } catch (e) {}
  }

  _fetchData(text) {
    setState(() {
      _searchFuture = animeListCluster(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: gainsboro,
          backgroundColor: darkblue,
          title: Center(
            child: Text(
              title,
              style: quicksand(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: gainsboro),
            ),
          )),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.ease,
        height: 50,
        backgroundColor: darkblue1,
        color: darkblue,
        onTap: (index) {
          _onItemTapped(index);
        },
        items: <Widget>[
          Icon(
            Icons.home,
            color: gainsboro,
          ),
          Icon(Icons.person, color: gainsboro),
          Icon(
            Icons.search,
            color: gainsboro,
          ),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {},
          children: [
            //CATALOG
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [darkblue1, darkblue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  color: darkblue),
              child: ListView(children: [
                Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    child: CategoryContainer(
                      text: 'Top Rated',
                      child: FutureAnimes(
                        genre: 'Top Rated',
                        future: _topRatedFuture,
                      ),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    child: CategoryContainer(
                      text: 'Action',
                      child: FutureAnimes(
                        genre: 'Action',
                        future: _actionFuture,
                      ),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    child: CategoryContainer(
                      text: 'Shounen',
                      child: FutureAnimes(
                        genre: 'Shounen',
                        future: _shounenFuture,
                      ),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    child: CategoryContainer(
                      text: 'Sports',
                      child: FutureAnimes(
                        genre: 'Sports',
                        future: _sportsFuture,
                      ),
                    )),
              ]),
            ),

            //PROFILE PAGE
            Container(
                decoration: BoxDecoration(color: darkblue),
                child: user != null
                    ? ListView(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 80, bottom: 20),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/profile.jpg'),
                                      radius: 70,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: Text(
                                      user.getName ?? 'Profile',
                                      style: quicksand(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: linen),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    darkblue1,
                                    darkblue1,
                                    darkblue,
                                    darkblue
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    onTap: () async {
                                      var favorites = await favoriteController
                                          .getFavorites(user.getUid);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Favorites(),
                                          settings: RouteSettings(
                                            arguments: [user, favorites],
                                          ),
                                        ),
                                      );
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
                                          settings:
                                              RouteSettings(arguments: user),
                                        ),
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
                                    onTap: () {
                                      WidgetsConstantes.alert(
                                        context: context,
                                        content: Text('Confirm logout?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text(
                                              'No',
                                              style: quicksand(
                                                fontWeight: FontWeight.bold,
                                                color: darkpurple,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              appController.prefClear();
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  PageTransition(
                                                    child: Catalog(),
                                                    type: PageTransitionType
                                                        .rightToLeftWithFade,
                                                    duration: Duration(
                                                        milliseconds: 800),
                                                    settings: RouteSettings(
                                                        name: 'catalog'),
                                                  ),
                                                  (route) => false);
                                            },
                                            child: Text(
                                              'Yes',
                                              style: quicksand(
                                                fontWeight: FontWeight.bold,
                                                color: darkpurple,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
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
                              ),
                            ),
                          )
                        ],
                      )
                    : ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              child: Wrap(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 20,
                                        top: 15,
                                        bottom: 15),
                                    child: Text(
                                      'You are accessing exclusive features for registered users, create an account to continue.',
                                      style: quicksand(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 10),
                              child: TextButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    Size(MediaQuery.of(context).size.width / 2,
                                        50),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0XFFDAE2E7),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: SignupPage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(milliseconds: 800),
                                      settings: RouteSettings(name: 'signup'),
                                    ),
                                  );
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
                          ),
                          Row(
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
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: LoginPage(),
                                        type: PageTransitionType
                                            .leftToRightWithFade,
                                        duration: Duration(milliseconds: 800),
                                        settings:
                                            RouteSettings(name: 'signin')),
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
                        ],
                      )),

            //SEARCH PAGE
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [darkblue1, darkblue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 25, right: 25),
                      child: TextFormField(
                        onChanged: (_value) {
                          _text = _value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            fillColor: darkblue3,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 20)),
                            labelText: 'Type your description here',
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
                    child: Align(
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
                        onPressed: () async {
                          if (_text == null || _text.length < 1) return;
                          _fetchData(_text);
                        },
                        child: Text(
                          'Search',
                          style: quicksand(
                              fontSize: 20.0,
                              color: darkpurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 465,
                    child: SearchAnimes(
                      future: _searchFuture,
                      user: user,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
