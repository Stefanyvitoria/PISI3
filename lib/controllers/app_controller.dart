import 'package:animecom/controllers/profile_controller.dart';
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
    prefs.remove('email');
  }

  prefSetUser(String email) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('email', email);
  }

  prefGetUser() async {
    SharedPreferences prefs = await _prefs;
    String email = prefs.getString('email');
    print('User: $email');
    return email;
  }

  loadUser() async {
    String email = await prefGetUser();
    if (email == null) return null;
    Profile user = await userController.getUser(email);
    return user;
  }
}
