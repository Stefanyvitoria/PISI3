import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddAnime extends StatefulWidget {
  @override
  _AddAnimeState createState() => _AddAnimeState();
}

class _AddAnimeState extends State<AddAnime> {
  String _title, _synopsis, _genre, _episodes;
  AnimeController animeController = AnimeController();

  @override
  Widget build(BuildContext context) {
    Profile user = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [darkblue2, darkblue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Container(
            width: 400,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Container(
                        child: Text('Add Anime to favorite',
                            style: quicksand(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: gainsboro))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _title = value,
                    type: TextInputType.name,
                    text: 'Title',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _synopsis = value,
                    text: 'Synopsis',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _genre = value,
                    text: 'Genre',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _episodes = value,
                    text: 'Episodes',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: false,
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0XFFDAE2E7)),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(width / 3, 50)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Anime anime = Anime(
                            title: _title,
                            synopsi: _synopsis,
                            episodes: int.parse(_episodes),
                            genre: _genre,
                          );
                          animeController.setAnime(anime);
                          //add to favorites

                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        'Save',
                        style: quicksand(
                            fontSize: 20.0,
                            color: darkpurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red[400]),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(width / 2, 50)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: quicksand(
                            fontSize: 20.0,
                            color: darkpurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
