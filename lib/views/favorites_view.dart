import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/firestore_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/container_anime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

UserController _userController = UserController();

_connection() {
  return FirebaseFirestore.instance
      .collection('Animes')
      .where('uid', isEqualTo: 28891)
      .snapshots();
}

List<Widget> makeListWidget(AsyncSnapshot snapshot) {
  return snapshot.data.docs.map<Widget>((document) {
    var name = document['name'];
    var score = document['score'];
    var img_url = document['img_url'];
    print(img_url);
    return AnimeContainer(
      name: name,
      score: score,
      imgurl: img_url,
    );
  }).toList();
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
            Icons.arrow_back_ios,
            color: gainsboro,
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
                  color: gainsboro),
            ),
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
