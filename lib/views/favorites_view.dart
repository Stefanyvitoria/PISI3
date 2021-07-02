import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/controllers/favorites_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/favorite_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/anime_container.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  AnimeController _animeController = AnimeController();
  Profile user;
  List favorites;

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
            return FutureBuilder(
              future: _animeController.getAnime(favorite.getAnimeUid),
              builder: (context, future) {
                while (!future.hasData) {
                  return Container();
                }
                Anime anime = future.data;
                return AnimeContainer(
                  name: anime.getName,
                  synopsis: anime.getSynopsi,
                  score: 10,
                  imgurl: anime.getImgUrl,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
