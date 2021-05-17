class ApiUrl {
  static const String baseUrl = 'https://geoproserver.herokuapp.com/api';

  // auth URLs
  static const String login = baseUrl + '/login/';
  static const String register = baseUrl + '/register/';

  // sponsorship URLs
  static const String getSponsorships = baseUrl + '/sponsorship/';
}
