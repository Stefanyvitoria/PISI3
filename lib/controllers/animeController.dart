import 'dart:convert';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/firestore_model.dart';
import 'package:flutter/services.dart';

class AnimeController {
  Future<String> _carregaAnimeJson() async {
    return await rootBundle.loadString('assets/dataset/base_animes.json');
  }

  Future carregaAluno(index) async {
    String jsonString = await _carregaAnimeJson();
    final jsonResponse = json.decode(jsonString);
    Map<String, dynamic> uid = jsonResponse['uid'];
    Map<String, dynamic> name = jsonResponse['title'];
    Map<String, dynamic> email = {};
    Map<String, dynamic> genre = jsonResponse['genre'];
    Map<String, dynamic> synopsis = jsonResponse['synopsis'];
    Map<String, dynamic> aired = jsonResponse['aired'];
    Map<String, dynamic> episode = jsonResponse['episodes'];
    Map<String, dynamic> member = jsonResponse['members'];
    Map<String, dynamic> popularity = jsonResponse['popularity'];
    Map<String, dynamic> score = jsonResponse['score'];
    Map<String, dynamic> ranked = jsonResponse['ranked'];
    Map<String, dynamic> img_url = jsonResponse['img_url'];
    Map<String, dynamic> link = jsonResponse['link'];

    Anime anime = new Anime.fromJson({
      'uid': uid[index],
      'name': name[index],
      'email': null,
      'genre': genre[index]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(', ')
          .toList(),
      'synopsis': synopsis[index],
      'aired': aired[index],
      'episodes': episode[index],
      'members': member[index],
      'popularity': popularity[index],
      'score': score[index],
      'ranked': ranked[index],
      'img_url': img_url[index],
      'link': link[index]
    });

    FirestoreModel().add('Animes', anime);
  }
}