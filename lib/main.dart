import 'package:flutter/material.dart';
import 'package:geopro/apply_screen.dart';
import 'package:geopro/login.dart';
import 'package:geopro/register.dart';
import 'package:geopro/services/application.dart';
import 'package:geopro/services/auth.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/sponsorship_screen.dart';
import 'package:geopro/add_sponsorship_screen.dart';
import 'package:geopro/widgets/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, SponsorshipProvider>(
          update: (_, auth, __) => SponsorshipProvider(auth),
          create: (context) => SponsorshipProvider(null),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ApplicationProvider>(
          update: (_, auth, __) => ApplicationProvider(auth),
          create: (context) => ApplicationProvider(null),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: LoginScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/addSponsorship': (context) => AddSponsorshipScreen(),
          '/sponsorships': (context) => SponsorshipScreen(),
          '/apply': (context) => ApplyScreen(),
        },
      ),
    );
  }
}
