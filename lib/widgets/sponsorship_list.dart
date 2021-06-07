import 'package:flutter/material.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:geopro/helpers/string_extensions.dart';

class SponsorshipListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Image.asset('assets/student_graduate.jpg'),
          ),
          Expanded(
            child: FutureBuilder(
              future:
                  Provider.of<SponsorshipProvider>(context).fetchSponsorships(),
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
                      return Container(
                        margin: const EdgeInsets.all(18.0),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Color(0xFFE9EAF2),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            clipBehavior: Clip.none,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
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
                                      snapshot.data[index].name
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
                                    snapshot.data[index].description,
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      height: 2.0,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  FlatButton(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text('View Sponsorship'),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
