import 'package:flutter/material.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:provider/provider.dart';

class SponsorshipScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsorships'),
      ),
      body: FutureBuilder(
        future: Provider.of<SponsorshipProvider>(context).fetchSponsorships(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              Center(
                child: Text('No sponsorships available'),
              );
            }
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(snapshot.data[index].name),
                subtitle: Text(snapshot.data[index].description),
                trailing: Wrap(
                  spacing: 8,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add scholarship',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addSponsorship');
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
