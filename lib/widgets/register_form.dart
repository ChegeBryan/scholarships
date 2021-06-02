import 'package:flutter/material.dart';
import 'package:geopro/helpers/validators.dart';
import 'package:geopro/services/auth.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

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
            TextFormField(
              controller: _username,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                labelText: 'Username',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
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
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
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
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _password,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: true,
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
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _confirmPassword,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                labelText: 'Confirm Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: true,
              textAlignVertical: TextAlignVertical.center,
              validator: (value) =>
                  value != _password.text ? 'Password does not match' : null,
            ),
            SizedBox(
              height: 16.0,
            ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  final Future<Map<String, dynamic>> successMessage = auth
                      .register(_email.text, _username.text, _password.text);

                  successMessage.then((response) {
                    if (response['status']) {
                      Navigator.pushReplacementNamed(context, '/sponsorships');
                    } else {
                      Map<String, dynamic> responseErrors = {};
                      var errorFields = response['message'].keys;
                      for (var errorField in errorFields) {
                        responseErrors.putIfAbsent(
                            errorField, () => response['message'][errorField]);
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
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ));
  }
}
