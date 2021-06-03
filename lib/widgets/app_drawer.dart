import 'package:flutter/material.dart';
import 'package:geopro/services/user.dart';
import 'package:geopro/util/shared_preferences.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(Provider.of<UserProvider>(context).user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/0.jpg'),
              ),
              margin: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/app_drawer.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
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
                        ListTile(
                          leading: Icon(Icons.mode_edit),
                          title: Text('Apply for Sponsorship'),
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, '/apply'),
                          selected:
                              ModalRoute.of(context).settings.name == '/apply',
                        )
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Logout'),
                      onTap: () {
                        // clear user data from local storage
                        UserPrefences().removeUser();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (Route<dynamic> route) => false,
                        );
                      },
                    )
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
