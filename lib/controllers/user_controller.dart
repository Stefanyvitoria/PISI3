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

  setUser(String email, String password) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['fields'] = 'email, pass';
    send['values'] = '"$email", "$password"';
    await _dataBaseModel.call("/insert", send);
  }

  updateUser(Profile user) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['values'] =
        'uid = ${user.getUid}, user_name = "${user.getName}", pass = "${user.getPassword}", gender = "${user.getGender}", birthday = "${user.getbirthday}", phone = "${user.getPhone}"';
    send['condition'] = 'uid = ${user.getUid}';
    await _dataBaseModel.call("/update", send);
  }

  deleteUser(int uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['condition'] = 'uid = $uid';
    await _dataBaseModel.call('/delete', send);
  }
}
