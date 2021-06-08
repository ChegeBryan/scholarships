import 'package:flutter/material.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class SponsorshipScreen extends StatelessWidget {
  showSponsorshipDetails(context, snapshot, index) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          height: MediaQuery.of(context).size.height * .5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                snapshot.data[index].name.toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    snapshot.data[index].description,
                    softWrap: true,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }

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
            return Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(4),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color(0xFFE9EAF2),
                    ),
                    child: Card(
                      clipBehavior: Clip.none,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: InkWell(
                        onTap: () =>
                            showSponsorshipDetails(context, snapshot, index),
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12.0,
                                      ),
                                      child: Text(
                                        snapshot.data[index].name.toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      snapshot.data[index].description,
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        height: 2.0,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: FlatButton(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: Row(
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text(
                                            'View Sponsorship',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 6.0),
                                            child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 12.0,
                                                color: Colors.grey
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () => showSponsorshipDetails(
                                          context, snapshot, index),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/addSponsorship',
                                          arguments: {
                                            'name': snapshot.data[index].name,
                                            'description': snapshot
                                                .data[index].description,
                                            'id': snapshot.data[index].id
                                          },
                                        );
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        sponsorshipProvider
                                            .deleteSponsorship(
                                                snapshot.data[index].id)
                                            .then((response) {
                                          if (response['status']) {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: const Text(
                                                  'Sponsorship deleted'),
                                              duration:
                                                  const Duration(seconds: 1),
                                            ));
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: const Text(
                                                  'Sponsorship has not been deleted'),
                                              duration:
                                                  const Duration(seconds: 1),
                                            ));
                                          }
                                        });
                                        Navigator.pushNamed(
                                            context, '/manage/sponsorships');
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
