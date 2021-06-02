import 'package:geopro/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefences {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', user.token);
    prefs.setString('email', user.email);
  }
}
