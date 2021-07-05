import 'package:animecom/models/favorite_model.dart';

class FavoriteController {
  Favorite _favorite = Favorite();

  Future getFavorites1(int user_uid, int anime_uid) async {
    List data = await _favorite.select(anime_uid, "/read");

    if (data.length == 0) return null;
    return data.map((e) => Favorite.fromJson(e)).toList();
  }

  Future getFavorites(int uid) async {
    List data = await _favorite.select(uid, "/read");
    if (data.length == 0) return null;
    return data.map((e) => Favorite.fromJson(e)).toList();
  }

  setFavorite(int anime_uid, int user_uid) async {
    await _favorite.setFav(user_uid, anime_uid);
  }

  deleteFavorite(int user_uid, int anime_uid) async {
    await _favorite.delete(user_uid, anime_uid);
  }

  countFavorites(int user_uid) async {
    List data = await _favorite.countFav(user_uid);
    if (data.length == 0) return null;

    return data;
  }

  // updateUser(Profile user) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'favorites';
  //   send['values'] =
  //       'uid = ${user.getUid}, user_name = "${user.getName}", pass = "${user.getPassword}", gender = "${user.getGender}", birthday = "${user.getbirthday}", phone = "${user.getPhone}"';
  //   send['condition'] = 'uid = ${user.getUid}';
  //   await _dataBaseModel.call("/update", send);
  // }

}
