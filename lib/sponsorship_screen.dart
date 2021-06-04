import 'package:flutter/material.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class SponsorshipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SponsorshipProvider sponsorshipProvider =
        Provider.of<SponsorshipProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsorships'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<SponsorshipProvider>(context).fetchSponsorships(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Text('No sponsorships available'),
              );
            }
            return ListView.builder(
                padding: EdgeInsets.all(4),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                          index != null ? snapshot.data[index].name : 'Empty'),
                      subtitle: Text(index != null
                          ? snapshot.data[index].description
                          : 'Empty'),
                      trailing: Wrap(
                        spacing: 8,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/addSponsorship',
                                  arguments: {
                                    'name': snapshot.data[index].name,
                                    'description':
                                        snapshot.data[index].description,
                                    'id': snapshot.data[index].id
                                  },
                                );
                              }),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                sponsorshipProvider
                                    .deleteSponsorship(snapshot.data[index].id)
                                    .then((response) {
                                  if (response['status']) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content:
                                          const Text('Sponsorship deleted'),
                                      duration: const Duration(seconds: 1),
                                    ));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: const Text(
                                          'Sponsorship has not been deleted'),
                                      duration: const Duration(seconds: 1),
                                    ));
                                  }
                                });
                                Navigator.pushNamed(context, '/sponsorships');
                              }),
                        ],
                      ),
                    ),
                  );
                });
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
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
