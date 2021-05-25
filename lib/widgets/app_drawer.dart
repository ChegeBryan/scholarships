import 'package:flutter/material.dart';
import 'package:geopro/services/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Text(Provider.of<AuthProvider>(context).userEmail),
          ),
          ListTile(
            title: Text('Sponsorships'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/sponsorships'),
            selected: ModalRoute.of(context).settings.name == '/sponsorships',
          ),
          ListTile(
            title: Text('Apply for Sponsorship'),
            onTap: () => Navigator.pushReplacementNamed(context, '/apply'),
            selected: ModalRoute.of(context).settings.name == '/apply',
          )
        ],
      ),
    );
  }
}
