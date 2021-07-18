import 'package:geopro/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefences {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', user.token!);
    prefs.setString('email', user.email!);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString('email');
    String? token = prefs.getString('token');

    return User(email: email, token: token, username: '');
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");
    prefs.remove("token");
  }
}
