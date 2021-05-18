import 'package:flutter/material.dart';

class ApplicationDetails extends StatelessWidget {
  final Map<String, dynamic> data;

  const ApplicationDetails({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(data['student']),
            ],
          ),
        ),
      ),
    );
  }
}
