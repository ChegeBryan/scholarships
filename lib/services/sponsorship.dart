import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geopro/models/sponsorship.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/services/user.dart';
import 'package:http/http.dart';

import 'api.dart';

class SponsorshipProvider with ChangeNotifier {
  UserProvider auth;

  SponsorshipProvider(this.auth);

  String sponsorshipUrl = ApiUrl.sponsorship;

  // get sponsorship list
  Future<List<Sponsorship>> fetchSponsorships() async {
    Response response = await get(
      sponsorshipUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 200) {
      List sponsorshipsList = jsonDecode(response.body);
      return sponsorshipsList
          .map<Sponsorship>((json) => Sponsorship.fromJson(json))
          .toList();
    } else {
      print(response.body);
    }
  }

  // add a new sponsorship
  Future<Map<String, dynamic>> addSponsorship(
      String name, String description) async {
    var result;

    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
    };

    Response response = await post(
      sponsorshipUrl,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 201) {
      result = {'status': true, 'message': 'Added sponsorship successfully'};
      print(jsonDecode(response.body));
    } else {
      result = {'status': false, 'message': jsonDecode(response.body)};
    }
    return result;
  }

  // delete sponsorship
  Future<Map<String, dynamic>> deleteSponsorship(int id) async {
    var result;

    Response response = await delete(
      '$sponsorshipUrl$id/',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 204) {
      result = {'status': true};
    } else {
      result = {'status': false, 'message': jsonDecode(response.body)};
    }

    return result;
  }

  // update sponsorship
  Future<Map<String, dynamic>> updateSponsorship(
      String name, String description, int id) async {
    var result;

    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'pk': id
    };

    Response response = await put(
      '$sponsorshipUrl$id/',
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'Sponsorship updated successfully'};
    } else {
      result = {'status': false, 'message': jsonDecode(response.body)};
      print(jsonDecode(response.body));
    }
    return result;
  }
}
