import 'package:animecom/pre-sets.dart';
import 'package:animecom/widgets/container_anime.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
              'Favorites',
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
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    AnimeContainer(
                      name: 'Haikyuu!!',
                      imgurl:
                          'https://cdn.myanimelist.net/images/anime/7/76014.jpg',
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
