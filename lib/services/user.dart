import 'package:flutter/foundation.dart';
import 'package:geopro/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user = User();

  User get user => _user!;

  void setUser(user) {
    _user = user;
    notifyListeners();
  }
}
