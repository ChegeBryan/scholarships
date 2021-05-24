import 'package:flutter/material.dart';
import 'package:geopro/widgets/add_sponsorship_form.dart';

class AddSponsorshipScreen extends StatefulWidget {
  @override
  _AddSponsorshipScreenState createState() => _AddSponsorshipScreenState();
}

class _AddSponsorshipScreenState extends State<AddSponsorshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sponsorship'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: AddSponsorshipForm(),
      ),
    );
  }
}