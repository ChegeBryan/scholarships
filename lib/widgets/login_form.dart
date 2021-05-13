import 'package:flutter/material.dart';
import 'package:geopro/services/auth.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value.isEmpty ? 'Please enter email' : null,
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
          auth.loggedInStatus == Status.Authenticating
              ? CircularProgressIndicator()
              : FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final Future<Map<String, dynamic>> successMessage =
                          auth.login(_email.text, _password.text);

                      successMessage.then((response) {
                        if (response['status']) {
                          Navigator.pushReplacementNamed(context, '/welcome');
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
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
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
        ],
      ),
    );
  }
}
