import 'package:animecom/models/profile_model.dart';

class UserController {
  Profile _profile = Profile();

  Future<Profile> getUser(String email) async {
    List data = await _profile.select(email);
    return data.length == 0 ? null : Profile.fromJson(data[0]);
  }

  setUser(String email, String password) async {
    await _profile.add('"$email", "$password"');
  }

  updateUser(Profile user) async {
    await _profile.update("/update", user);
  }

  deleteUser(int uid) async {
    await _profile.delete(uid);
  }
}
