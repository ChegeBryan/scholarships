class ApiUrl {
  static const String baseUrl = 'https://geoproserver.herokuapp.com/api';

  // auth URLs
  static const String login = baseUrl + '/login/';
  static const String register = baseUrl + '/register/';

  // sponsorship URLs
  static const String sponsorship = baseUrl + '/sponsorship/';
  static const String deleteSponsorship = baseUrl + '/sponsorship/id/';

  // sponsorship application
  static const String apply = baseUrl + '/apply/';
}
