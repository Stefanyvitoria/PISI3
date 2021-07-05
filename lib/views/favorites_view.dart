import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/controllers/favorites_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/evaluation_model.dart';
import 'package:animecom/models/favorite_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/add_animefavorites_view.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/anime_container.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  AnimeController _animeController = AnimeController();
  FavoriteController _favoriteController = FavoriteController();
  Profile user;
  List favorites;

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    user = args[0];
    favorites = args[1];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddAnime(),
                settings: RouteSettings(arguments: user))),
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(color: darkpurple),
        child: favorites == null
            ? Container(
                child: Center(
                  child: Text(
                    'Nothing around here yet.',
                    style: quicksand(
                        color: linen,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    FutureBuilder(
                        future: _favoriteController.countFavorites(user.getUid),
                        builder: (context, snapshot) {
                          while (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          return Text(
                            'Favoritos: ${snapshot.data[0][0]}',
                            style: quicksand(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: gainsboro),
                          );
                        }),
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, c) {
                          Favorite favorite = favorites[c];
                          return FutureBuilder(
                            future:
                                _animeController.getAnime(favorite.getAnimeUid),
                            builder: (context, future) {
                              while (!future.hasData) {
                                return Container();
                              }
                              Anime anime = future.data;
                              return FutureBuilder(
                                future: _animeController
                                    .getAnimeEvaluation(favorite.getAnimeUid),
                                builder: (context, future1) {
                                  while (!future1.hasData) {
                                    return Container();
                                  }
                                  Evaluation evaluation = future1.data;
                                  return AnimeContainer(
                                    name: anime.getName,
                                    tag: anime.getAnimeUid.toString(),
                                    anime: anime,
                                    synopsis: anime.getSynopsi,
                                    score: evaluation.getScore.toInt(),
                                    imgurl: anime.getImgUrl,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
