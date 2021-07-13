import 'package:flutter/material.dart';
import 'package:geopro/services/auth.dart';
import 'package:geopro/services/user.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> errors = {};
  bool _obscureText = true;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 48.0,
              color: Colors.white,
              child: TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Please enter email' : null,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 48.0,
              color: Colors.white,
              child: TextFormField(
                controller: _password,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Please enter password' : null,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          auth.loggedInStatus == Status.Authenticating
              ? CircularProgressIndicator()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        final Future<Map<String, dynamic>> successMessage =
                            auth.login(_email.text, _password.text);

                        successMessage.then((response) {
                          if (response['status']) {
                            Provider.of<UserProvider>(context, listen: false)
                                .setUser(response['user']);
                            Navigator.pushReplacementNamed(
                                context, '/sponsorships');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(response['message']
                                        ['non_field_errors'][0]
                                    .toString()),
                                backgroundColor: Colors.red));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
