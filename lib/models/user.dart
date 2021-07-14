class User {
  String username;
  String email;
  String token;

  User({required this.email, required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      username: responseData['username'],
      email: responseData['email'],
      token: responseData['token'],
    );
  }
}
