import 'package:flutter/material.dart';
import 'package:geopro/models/sponsorship.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/application_form.dart';
import 'package:provider/provider.dart';

class ApplyScreen extends StatefulWidget {
  @override
  _ApplyScreenState createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsorship Application'),
      ),
      body: FutureBuilder(
        future: Provider.of<SponsorshipProvider>(context).fetchSponsorships(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('No sponsorships available.'),
              );
            }
            return ApplicationForm(
              sponsorshipList: snapshot.data,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
