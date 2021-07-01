import 'dart:convert';

import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/api_model.dart';
import 'package:animecom/models/user_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/widgets_constantes.dart';
import 'package:animecom/views/widgets/anime_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

// ***** Não esquecer de remover
_connection() {
  return FirebaseFirestore.instance
      .collection('Animes')
      .where('episode', isEqualTo: 26.0)
      .snapshots();
}

// ***** ferindo o princípio de aberto fechado
List<Widget> makeListWidget(AsyncSnapshot snapshot) {
  return snapshot.data.docs.map<Widget>((document) {
    var name = document['name'];
    var synopsis = document['synopsis'];
    var score = document['score'];
    var img_url = document['img_url'];
    return AnimeContainer(
      name: name,
      synopsis: synopsis,
      score: score,
      imgurl: img_url,
    );
  }).toList();
}

class _FavoritesState extends State<Favorites> {
  UserController _userController;
  User user;
  String _title, _synopsis, _genre, _episodes, _server;

  @override
  void initState() {
    _userController = UserController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List _args = ModalRoute.of(context).settings.arguments;
    user = _args[0];
    _server = _args[1];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              WidgetsConstantes.bottomSheet(
                context: context,
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Text(
                        'Add anime to favorites',
                        style: quicksand(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: darkpurple),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (_value) => _title = _value,
                        decoration: InputDecoration(
                            fillColor: darkblue3,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 20)),
                            labelText: 'Title',
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (_value) => _synopsis = _value,
                        decoration: InputDecoration(
                            fillColor: darkblue3,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 20)),
                            labelText: 'Synopsis',
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (_value) => _genre = _value,
                        decoration: InputDecoration(
                            fillColor: darkblue3,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 20)),
                            labelText: 'Genre',
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (_value) => _episodes = _value,
                        decoration: InputDecoration(
                            fillColor: darkblue3,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 20)),
                            labelText: 'Episodes',
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
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () async {
                        //falta validar fields
                        Map envio = new Map<String, dynamic>();
                        envio["title"] = _title;
                        envio["synopsis"] = _synopsis;
                        envio["genre"] = _genre;
                        envio["episodes"] = _episodes;
                        var result = await apiRest.call(
                          server: _server,
                          path: '/insert',
                          params: {'params': jsonEncode(envio)},
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Add Anime',
                        style: TextStyle(color: darkpurple),
                      ),
                    )
                  ],
                ),
              );
            },
            icon: Icon(Icons.add_sharp, color: gainsboro),
          )
        ],
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            Icons.arrow_back_ios,
            color: gainsboro,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Favorites',
            style: quicksand(
                fontSize: 18.0, fontWeight: FontWeight.bold, color: gainsboro),
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: darkblue,
      ),
      body: Container(
        decoration: BoxDecoration(color: darkblue),
        child: StreamBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView(
                  children: makeListWidget(snapshot),
                );
            }
          },
          stream: _connection(),
        ),
      ),
    );
  }
}
