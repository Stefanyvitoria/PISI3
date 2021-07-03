import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/evaluation_model.dart';

import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';

class Anime_info extends StatefulWidget {
  Anime_info(
      {Key key, this.info, this.genre, this.anime, this.ranked, this.score})
      : super(key: key);

  final Anime anime;
  final int ranked;
  final int score;
  final int info;
  final String genre;
  @override
  _Anime_infoState createState() => _Anime_infoState();
}

class _Anime_infoState extends State<Anime_info> {
  @override
  Widget build(BuildContext context) {
    AnimeController _animeController = AnimeController();

    return Container(
      decoration: BoxDecoration(
          color: darkblue,
          border: Border.all(color: darkblue2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: '${widget.info}' + widget.genre,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 5, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: darkblue2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.anime.getImgUrl))),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 0, bottom: 10.0),
                child: Container(
                  color: darkblue,
                  width: MediaQuery.of(context).size.width - 157,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: gainsboro,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Row(
                          children: [
                            Container(
                              width: 180,
                              child: Text(
                                widget.anime.getName,
                                style: quicksand(
                                    color: gainsboro,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 21.0),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 5.0,
                          bottom: 10,
                        ),
                        child: Container(
                          width: 230,
                          child: Text(
                            'Episodes: ' + widget.anime.getEpisodes.toString(),
                            style: quicksand(
                                color: gainsboro,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          'Aired: ' + widget.anime.getStart,
                          style: quicksand(
                              color: gainsboro,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Rank: ${widget.ranked}",
                          style: quicksand(
                              color: gainsboro,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          'Genders: ' +
                              widget.anime.getGenre
                                  .replaceAll('[', '( ')
                                  .replaceAll(']', ' )')
                                  .replaceAll("'", ''),
                          style: quicksand(
                              color: gainsboro,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Score: ${widget.score}",
                          style: quicksand(
                              color: favyellow,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: darkblue2,
                border: Border.all(color: darkblue4, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 500,
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    '[Synopsis]\n\n ${widget.anime.getSynopsi}',
                    style: quicksand(
                        color: gainsboro,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// Container(
//         height: 20,
//         width: 20,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           color: darkblue2,
//         ),
//         child: Container(
//           height: 300,
//           width: 170,

//         ),
//       ),
