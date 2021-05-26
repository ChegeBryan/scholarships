import 'package:flutter/material.dart';
import 'package:geopro/services/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Text(Provider.of<AuthProvider>(context).userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/0.jpg'),
            ),
          ),
          Expanded(
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
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (Route<dynamic> route) => false,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
