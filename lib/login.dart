import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Color(0xFF5464BF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginForm(),
              FormBottomActions(
                message: 'Don\'t have account?',
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
