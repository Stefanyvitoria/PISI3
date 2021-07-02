import 'package:animecom/models/DB_model.dart';
import 'package:animecom/models/favorite_model.dart';

class FavoriteController {
  DataBaseModel _dataBaseModel = DataBaseModel();

  Future getFavorites(int uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'favorites';
    send['condition'] = 'user_uid = "$uid"';
    List data = await _dataBaseModel.select(send, "/read");
    if (data.length == 0) return null;
    return data.map((e) => Favorite.fromJson(e)).toList();
  }

  // setUser(String email, String password) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'favorites';
  //   send['fields'] = 'email, pass';
  //   send['values'] = '"$email", "$password"';
  //   await _dataBaseModel.call("/insert", send);
  // }

  // updateUser(Profile user) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'favorites';
  //   send['values'] =
  //       'uid = ${user.getUid}, user_name = "${user.getName}", pass = "${user.getPassword}", gender = "${user.getGender}", birthday = "${user.getbirthday}", phone = "${user.getPhone}"';
  //   send['condition'] = 'uid = ${user.getUid}';
  //   await _dataBaseModel.call("/update", send);
  // }

  // deleteUser(int uid) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'favorites';
  //   send['condition'] = 'uid = $uid';
  //   await _dataBaseModel.call('/delete', send);
  // }
}
