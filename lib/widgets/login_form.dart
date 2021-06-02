import 'package:flutter/material.dart';
import 'package:geopro/services/auth.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  Map<String, dynamic> errors = {};

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
      autovalidate: _autovalidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: 'Email',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            validator: (value) => value.isEmpty ? 'Please enter email' : null,
          ),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            controller: _password,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
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
            validator: (value) =>
                value.isEmpty ? 'Please enter password' : null,
          ),
          SizedBox(
            height: 16.0,
          ),
          auth.loggedInStatus == Status.Authenticating
              ? CircularProgressIndicator()
              : FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final Future<Map<String, dynamic>> successMessage =
                          auth.login(_email.text, _password.text);

                      successMessage.then((response) {
                        if (response['status']) {
                          Navigator.pushReplacementNamed(
                              context, '/sponsorships');
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(response['message']
                                      ['non_field_errors'][0]
                                  .toString()),
                              backgroundColor: Colors.red));
                        }
                      });
                    } else {
                      setState(() {
                        _autovalidate = true;
                      });
                    }
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
        ],
      ),
    );
  }
}
