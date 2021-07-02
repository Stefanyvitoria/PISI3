import 'package:animecom/controllers/user_controller.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appController = AppController();

class AppController {
  String _server;
  set setServer(String path) => _server = path;
  get getServer => _server;
  UserController userController = UserController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  prefClear() async {
    SharedPreferences prefs = await _prefs;
    prefs.remove('uid');
  }

  prefSetUser(int uid) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setInt('uid', uid);
  }

  prefGetUser() async {
    SharedPreferences prefs = await _prefs;
    int uid = prefs.getInt('uid');
    //print('User uid: $useruid');
    return uid;
  }

  loadUser() async {
    int _uid = await prefGetUser();
    if (_uid == null) return null;
    Profile user = await userController.getUser(_uid.toString(), _server);
    return user;
  }
}
