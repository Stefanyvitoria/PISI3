import 'package:animecom/models/DB_model.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  DataBaseModel _dataBaseModel = DataBaseModel();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Profile> getUser(String _uid, String server) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['condition'] = 'uid = ' + _uid;
    List data = await _dataBaseModel.select(send, server, "/read");
    return data.length == 0 ? null : Profile.fromJson(data[0]);
  }
}
