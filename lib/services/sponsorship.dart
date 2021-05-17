import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geopro/models/sponsorship.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/services/auth.dart';
import 'package:http/http.dart';

class SponsorshipProvider with ChangeNotifier {
  AuthProvider auth;

  SponsorshipProvider(this.auth);

  // get sponsorhsip list
  Future<List<Sponsorship>> fetchSponsorships() async {
    Response response = await get(
      ApiUrl.getSponsorships,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
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
}
