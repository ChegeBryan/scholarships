import 'package:flutter/material.dart';
import 'package:geopro/widgets/form_bottom_actions.dart';
import 'package:geopro/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginForm(),
              FormBottomActions(
                message: 'Dont have account?',
                action: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                actionText: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
