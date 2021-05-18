import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geopro/models/application.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/services/auth.dart';
import 'package:http/http.dart';

class ApplicationProvider with ChangeNotifier {
  AuthProvider auth;

  ApplicationProvider(this.auth);

  String applicationUrl = ApiUrl.apply;

  //Save sponsorship application
  Future<Map<String, dynamic>> addApplication({
    String sponsorshipId,
    String firstName,
    String lastName,
    String mobile,
    String country,
    String city,
    String schoolName,
    String degree,
    String coverLetter,
    String start,
    String to,
    String postalCode,
    String birthCertificate,
    String nationalId,
  }) async {
    //serialize to JSON
    final Map<String, dynamic> data = Application(
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      country: country,
      city: city,
      schoolName: schoolName,
      degree: degree,
      coverLetter: coverLetter,
      start: start,
      to: to,
      postalCode: postalCode,
      birthCertificate: birthCertificate,
      nationalId: nationalId,
    ).toJson();

    Response response = await post("$applicationUrl$sponsorshipId/", headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${auth.token}',
    });

    if (response.statusCode == 201) {
      Map<String, dynamic> application = jsonDecode(response.body);
      return application;
    } else {
      print(response.body);
    }
  }
}
