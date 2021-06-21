class ApiUrl {
  static const String baseUrl = 'https://geoproserver.herokuapp.com/api';

  // auth URLs
  static const String login = baseUrl + '/login/';
  static const String register = baseUrl + '/register/';

  // sponsorship URLs
  static const String sponsorship = baseUrl + '/sponsorship/';

  // sponsorship application
  static const String apply = baseUrl + '/apply/';

  // Fake FAQS url:
  static const String faqs = 'http://myjson.dit.upm.es/api/bins/x6w';
}
