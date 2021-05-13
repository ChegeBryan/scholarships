import 'package:flutter/material.dart';
import 'package:geopro/widgets/form_bottom_actions.dart';
import 'package:geopro/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              RegisterForm(),
              FormBottomActions(
                message: 'Have account?',
                action: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                actionText: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
