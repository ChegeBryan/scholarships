import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geopro/models/application.dart';
import 'package:geopro/services/api.dart';
import 'package:geopro/services/user.dart';
import 'package:http/http.dart';

enum Status { Submitting, NotSubmitted, Submitted }

class ApplicationProvider with ChangeNotifier {
  UserProvider auth;

  ApplicationProvider(this.auth);

  String applicationUrl = ApiUrl.apply;

  Status _submissionStatus = Status.NotSubmitted;

  Status get submissionStatus => _submissionStatus;

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
    var result;

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

    _submissionStatus = Status.Submitting;
    notifyListeners();

    Response response = await post("$applicationUrl$sponsorshipId/",
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${auth.user.token}',
        });

    if (response.statusCode == 201) {
      Map<String, dynamic> application = jsonDecode(response.body);

      _submissionStatus = Status.Submitted;
      notifyListeners();

      result = {'status': true, 'message': 'success', 'data': application};
    } else {
      _submissionStatus = Status.NotSubmitted;
      notifyListeners();

      result = {
        'status': false,
        'message': 'failed',
        'errors': jsonDecode(response.body)
      };
    }

    return result;
  }
}
