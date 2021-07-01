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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF16202B),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/student_graduate.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
