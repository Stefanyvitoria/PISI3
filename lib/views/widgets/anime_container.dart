import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/category_container.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../anime_info_view.dart';

class AnimeContainer extends StatelessWidget {
  final Key key;
  final String name;
  final String synopsis;
  final int score;
  final Profile user;
  final String tag;
  final String genre;
  final int ranked;
  final int anime_uid;
  final anime;
  final String imgurl;

  const AnimeContainer(
      {this.key,
      this.name,
      this.user,
      this.anime_uid,
      this.synopsis,
      this.score,
      this.genre,
      this.ranked,
      this.imgurl,
      this.tag,
      this.anime});
  @override
  Widget build(BuildContext context) {
    AnimeController _animeController = AnimeController();

    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Hero(
                  tag: tag,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(TransparentRoute(
                          builder: (BuildContext context) => Anime_info(
                              info: anime_uid,
                              genre: genre,
                              ranked: _animeController.numbGetter(ranked),
                              score: _animeController.numbGetter(score),
                              anime: Anime.fromJson(anime))));
                    },
                    child: Container(
                      height: 170,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  _animeController.imgGetter(imgurl)),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
                child: Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        style: quicksand(
                            color: gainsboro,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.0,
                          bottom: 10,
                        ),
                        child: Text(
                          "Score: ${_animeController.numbGetter(score)}",
                          style: quicksand(
                              color: favyellow,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: darkblue2,
                          border: Border.all(color: darkblue4, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: 230,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              '[Synopsis]\n\n' +
                                  _animeController.stringGetter(synopsis),
                              style: quicksand(
                                  color: gainsboro,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(
                    isFavorite: false,
                    iconColor: Colors.red[400],
                    valueChanged: (value) {
                      // if (value == true) {
                      //   _favoriteController.setFavorite(anime_uid, user.getUid);
                      // } else {
                      //   _favoriteController.deleteFavorite(
                      //       anime_uid, user.getUid);
                      // }
                    },
                    iconSize: 35,
                  ),
                ),
              )
            ],
          ),
          height: 200,
          width: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkblue2, darkblue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              border: Border.all(color: darkblue2),
              color: darkblue,
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}

class SearchAnimes extends StatelessWidget {
  final Key key;
  final future;
  final Profile user;
  final itemCount;
  const SearchAnimes({this.key, this.future, this.itemCount, this.user});

  @override
  Widget build(BuildContext context) {
    AnimeController _animeController = AnimeController();

    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return AnimeContainer(
                    tag: "${snapshot.data[i][0]}",
                    ranked: _animeController.numbGetter(snapshot.data[i][12]),
                    anime: snapshot.data[i],
                    genre: _animeController.stringGetter(snapshot.data[i][3]),
                    anime_uid: snapshot.data[i][0],
                    user: user,
                    name: _animeController.stringGetter(snapshot.data[i][1]),
                    score: _animeController.numbGetter(snapshot.data[i][13]),
                    synopsis:
                        _animeController.stringGetter(snapshot.data[i][2]),
                    imgurl: _animeController.imgGetter(snapshot.data[i][7]),
                  );
                });
          }
        });
  }
}
