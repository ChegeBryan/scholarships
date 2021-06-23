import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:geopro/services/user.dart';
import 'package:geopro/util/shared_preferences.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Image.asset('assets/student_graduate.jpg'),
                ),
                Positioned.fill(
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/women/0.jpg',
                          ),
                          radius: 48.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Test Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 3.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              Provider.of<UserProvider>(context).user.email,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 3.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text('Sponsorships'),
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/sponsorships'),
                          selected: ModalRoute.of(context).settings.name ==
                              '/sponsorships',
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Manage Sponsorships'),
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/manage/sponsorships'),
                          selected: ModalRoute.of(context).settings.name ==
                              '/manage/sponsorships',
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.question_answer),
                          title: Text('Frequently Asked Questions'),
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, '/faqs'),
                          selected:
                              ModalRoute.of(context).settings.name == '/faqs',
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FlatButton(
                        onPressed: () {
                          // clear user data from local storage
                          UserPrefences().removeUser().then(
                                (value) => Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (Route<dynamic> route) => false,
                                ),
                              );
                        },
                        textColor: Colors.white,
                        shape: StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
