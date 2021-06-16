import 'package:flutter/material.dart';
import 'package:geopro/apply_screen.dart';
import 'package:geopro/faq_screen.dart';
import 'package:geopro/login.dart';
import 'package:geopro/register.dart';
import 'package:geopro/services/application.dart';
import 'package:geopro/services/auth.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/services/user.dart';
import 'package:geopro/sponsorship_screen.dart';
import 'package:geopro/add_sponsorship_screen.dart';
import 'package:geopro/util/shared_preferences.dart';
import 'package:geopro/widgets/sponsorship_list.dart';
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
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProxyProvider<UserProvider, SponsorshipProvider>(
          update: (_, auth, __) => SponsorshipProvider(auth),
          create: (context) => SponsorshipProvider(null),
        ),
        ChangeNotifierProxyProvider<UserProvider, ApplicationProvider>(
          update: (_, auth, __) => ApplicationProvider(auth),
          create: (context) => ApplicationProvider(null),
        ),
      ],
      child: MaterialApp(
        title: 'Geopro Sponsorship',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: FutureBuilder(
          future: UserPrefences().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.token == null) {
                return LoginScreen();
              }
              Provider.of<UserProvider>(context).setUser(snapshot.data);
              return SponsorshipListScreen();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/addSponsorship': (context) => AddSponsorshipScreen(),
          '/sponsorships': (context) => SponsorshipListScreen(),
          '/manage/sponsorships': (context) => SponsorshipScreen(),
          '/apply': (context) => ApplyScreen(),
          '/faqs': (context) => FaqScreen(),
        },
      ),
    );
  }
}
