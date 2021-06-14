import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geopro/models/user.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/util/shared_preferences.dart';
import 'package:http/http.dart';

enum Status { LoggedIn, NotLoggedIn, Authenticating }

class AuthProvider with ChangeNotifier {
  // track authentication status
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response res = await post(
      ApiUrl.login,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      User authUser = User.fromJson(responseData);

      // persist user on app.
      UserPrefences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      result = {'status': false, 'message': jsonDecode(res.body)};
    }

    return result;
  }

  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    var result;

    final Map<String, dynamic> data = {
      'email': email,
      'username': username,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response res = await post(
      ApiUrl.register,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      User authUser = User.fromJson(responseData);

      // persist user on app.
      UserPrefences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {'status': false, 'message': jsonDecode(res.body)};
    }

    return result;
  }
}
