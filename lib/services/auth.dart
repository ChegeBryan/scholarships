import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geopro/models/user.dart';
import 'package:geopro/services/api.dart';
import 'package:http/http.dart';

enum Status { LoggedIn, NotLoggedIn }

class AuthProvider with ChangeNotifier {
  // track authentication status
  Status _loggedInStatus = Status.NotLoggedIn;

  String _userEmail;

  Status get loggedInStatus => _loggedInStatus;

  String get userEmail => _userEmail;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    Response res = await post(
      ApiUrl.login,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      User authUser = User.fromJson(responseData);

      _loggedInStatus = Status.LoggedIn;
      _userEmail = authUser.email;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
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

    Response res = await post(
      ApiUrl.register,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      User authUser = User.fromJson(responseData);

      _loggedInStatus = Status.LoggedIn;
      _userEmail = authUser.email;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {'status': false, 'message': jsonDecode(res.body)};
    }

    return result;
  }
}
