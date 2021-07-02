import 'package:flutter/material.dart';
import 'package:geopro/helpers/validators.dart';
import 'package:geopro/services/auth.dart';
import 'package:geopro/services/user.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  bool _obscureText = true;

  Map<String, dynamic> errors = {};

  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _username.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      autovalidate: _autovalidate,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 48.0,
              color: Colors.white,
              child: TextFormField(
                controller: _username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  } else if (value.length < 3) {
                    return 'Username allows a minimum of 3 characters.';
                  } else if (errors.containsKey('username')) {
                    return errors['username'].reduce((v, e) => v + '\n' + e);
                  }
                  return null;
                },
                onChanged: (value) {
                  errors.remove('username');
                },
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
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  labelText: 'Email',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email';
                  } else if (!isEmail(value)) {
                    return 'Provide a valid email';
                  } else if (errors.containsKey('email')) {
                    return errors['email'].reduce((v, e) => v + '\n' + e);
                  }
                  return null;
                },
                onChanged: (value) {
                  errors.remove('email');
                },
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
                  labelText: 'Password',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length < 8) {
                    return 'Password cannot be less than 8 Characters';
                  } else if (errors.containsKey('password')) {
                    return errors['password'].reduce((v, e) => v + '\n' + e);
                  }
                  return null;
                },
                onChanged: (value) {
                  errors.remove('password');
                },
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
                controller: _confirmPassword,
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
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
                  labelText: 'Confirm Password',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
                validator: (value) =>
                    value != _password.text ? 'Password does not match' : null,
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
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        final Future<Map<String, dynamic>> successMessage =
                            auth.register(
                                _email.text, _username.text, _password.text);

                        successMessage.then((response) {
                          if (response['status']) {
                            Provider.of<UserProvider>(context, listen: false)
                                .setUser(response['user']);
                            Navigator.pushReplacementNamed(
                                context, '/sponsorships');
                          } else {
                            Map<String, dynamic> responseErrors = {};
                            var errorFields = response['message'].keys;
                            for (var errorField in errorFields) {
                              responseErrors.putIfAbsent(errorField,
                                  () => response['message'][errorField]);
                            }
                            setState(() {
                              errors = responseErrors;
                            });
                          }
                        });
                      } else {
                        setState(() {
                          _autovalidate = true;
                        });
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
        ],
      ),
    );
  }
}
