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
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _username,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter email';
                } else if (!isEmail(value)) {
                  return 'Provide a valid email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) =>
                  value.isEmpty ? 'Please enter password' : null,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _confirmPassword,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
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
                  final Future<Map<String, dynamic>> successMessage = auth
                      .register(_email.text, _username.text, _password.text);

                  successMessage.then((response) {
                    if (response['status']) {
                      Navigator.pushReplacementNamed(context, '/welcome');
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(response['message'].toString())));
                    }
                  });
                }
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ));
  }
}
