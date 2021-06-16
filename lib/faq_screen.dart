import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Frequently Asked Questions:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
