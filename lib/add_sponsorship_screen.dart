import 'package:flutter/material.dart';
import 'package:geopro/widgets/add_sponsorship_form.dart';

class AddSponsorshipScreen extends StatefulWidget {
  @override
  _AddSponsorshipScreenState createState() => _AddSponsorshipScreenState();
}

class _AddSponsorshipScreenState extends State<AddSponsorshipScreen> {
  @override
  Widget build(BuildContext context) {
    final Map? arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
          title:
              Text(arguments != null ? 'Edit Sponsorship' : 'Add Sponsorship'),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            child: arguments != null
                ? AddSponsorshipForm(
                    name: arguments['name'],
                    description: arguments['description'],
                    id: arguments['id'],
                  )
                : AddSponsorshipForm(),
          ),
        ));
  }
}
