import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geopro/models/sponsorship.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/services/user.dart';
import 'package:http/http.dart';

import 'api.dart';

enum Status { Added, Adding, NotAdded, Updated, Updating, NotUpdated }

class SponsorshipProvider with ChangeNotifier {
  Status addedStatus;
  Status updatedStatus;

  UserProvider auth;

  SponsorshipProvider(this.auth);

  String sponsorshipUrl = ApiUrl.sponsorship;

  // get sponsorship list
  Future<List<Sponsorship>> fetchSponsorships() async {
    List sponsorshipsList;

    Response response = await get(
      sponsorshipUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 200) {
      sponsorshipsList = jsonDecode(response.body);
      return sponsorshipsList
          .map<Sponsorship>((json) => Sponsorship.fromJson(json))
          .toList();
    } else {
      return sponsorshipsList;
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

    addedStatus = Status.Adding;
    notifyListeners();

    Response response = await post(
      sponsorshipUrl,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 201) {
      addedStatus = Status.Added;
      notifyListeners();
      result = {'status': true, 'message': 'Added sponsorship successfully'};
    } else {
      addedStatus = Status.NotAdded;
      notifyListeners();
      result = {'status': false, 'message': jsonDecode(response.body)};
      print(jsonDecode(response.body)["name"][0]);
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

    updatedStatus = Status.Updating;
    notifyListeners();

    Response response = await put(
      '$sponsorshipUrl$id/',
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.user.token}',
      },
    );

    if (response.statusCode == 200) {
      updatedStatus = Status.Updated;
      notifyListeners();
      result = {'status': true, 'message': 'Sponsorship updated successfully'};
    } else {
      updatedStatus = Status.NotUpdated;
      notifyListeners();
      result = {'status': false, 'message': jsonDecode(response.body)};
    }
    return result;
  }
}
