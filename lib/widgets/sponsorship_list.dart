import 'package:flutter/material.dart';
import 'package:geopro/models/sponsorship.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:geopro/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:geopro/helpers/string_extensions.dart';

class SponsorshipListScreen extends StatelessWidget {
  // laucnhes sponsorship details modal
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
                snapshot.data[index].name.toString().inCaps,
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
              Align(
                child: Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: StadiumBorder(),
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        '/apply',
                        arguments: {
                          'id': snapshot.data[index].id,
                          'name': snapshot.data[index].name,
                          'sponsorships': snapshot.data,
                        },
                      );
                    },
                    child: Text(
                      'Apply Now',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
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
    return Scaffold(
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<SponsorshipProvider>(context).fetchSponsorships(),
        builder: (context, AsyncSnapshot<List<Sponsorship>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return CustomScrollView(
                slivers: <Widget>[
                  AppBarWidget(),
                  SliverFillRemaining(
                    child: Center(
                      child: Text('No sponsorships available'),
                    ),
                  ),
                ],
              );
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: <Widget>[
                AppBarWidget(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(18.0),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Card(
                          clipBehavior: Clip.none,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: InkWell(
                            onTap: () => showSponsorshipDetails(
                                context, snapshot, index),
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12.0,
                                    ),
                                    child: Text(
                                      snapshot.data![index].name
                                          .toString()
                                          .inCaps,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].description,
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      height: 2.0,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                    ),
                                    child: Row(
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                          'View Sponsorship',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 12.0, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    onPressed: () => showSponsorshipDetails(
                                        context, snapshot, index),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                )
              ],
            );
          }
          return CustomScrollView(
            slivers: <Widget>[
              AppBarWidget(),
              SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
