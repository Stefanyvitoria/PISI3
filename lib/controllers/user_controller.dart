import 'package:animecom/models/DB_model.dart';
import 'package:animecom/models/profile_model.dart';

class UserController {
  DataBaseModel _dataBaseModel = DataBaseModel();

  Future<Profile> getUser(String email) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['condition'] = 'email = "$email"';
    List data = await _dataBaseModel.select(send, "/read");
    return data.length == 0 ? null : Profile.fromJson(data[0]);
  }

  addUser(String email, String password) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['fields'] = 'email, pass';
    send['values'] = '"$email", "$password"';
    await _dataBaseModel.add("/insert", send);
  }
}
