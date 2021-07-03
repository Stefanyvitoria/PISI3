import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';

class AnimeContainer extends StatelessWidget {
  final Key key;
  final String name;
  final String synopsis;
  final int score;
  final String imgurl;

  const AnimeContainer(
      {this.key, this.name, this.synopsis, this.score, this.imgurl});
  @override
  Widget build(BuildContext context) {
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
                child: Container(
                  height: 170,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                          image: NetworkImage(imgurl), fit: BoxFit.fill)),
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
                          "Score: ${score}",
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
                              '[Synopsis]\n\n' + synopsis,
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
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: favyellow,
                  size: 20,
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
  final itemCount;
  const SearchAnimes({this.key, this.future, this.itemCount});

  a(uid) async {
    return await AnimeController().getAnimeEvaluation(uid);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: 15,
                itemBuilder: (context, i) {
                  print(snapshot.data[i][1]);
                  return AnimeContainer(
                    name: snapshot.data[i][1],
                    score: snapshot.data[i][13],
                    synopsis: snapshot.data[i][2],
                    imgurl: snapshot.data[i][7],
                  );
                });
          }
        });
  }
}
