class User {
  String username;
  String email;
  String token;

  User({this.email, this.username, this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      username: responseData['username'],
      email: responseData['email'],
      token: responseData['token'],
    );
  }
}
