import 'dart:convert';

import 'package:animecom/controllers/favorites_controller.dart';
import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/api_model.dart';
import 'package:animecom/models/favorite_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/widgets_constantes.dart';
import 'package:animecom/views/widgets/anime_container.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoriteController favoriteController = FavoriteController();
  Profile user;
  List favorites;
  String _title, _synopsis, _genre, _episodes, _server;

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    user = args[0];
    favorites = args[1];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: darkpurple),
        child: ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, c) {
              Favorite favorite = favorites[c];
              return Container(
                child: Text(
                  'anime uid: ${favorite.getAnimeUid}\nuser uid: ${favorite.getUserUid}\n\n',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
